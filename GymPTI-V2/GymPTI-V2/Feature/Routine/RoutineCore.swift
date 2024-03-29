//
//  RoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture

public struct Routine: Reducer {
    
    public struct State: Equatable {
        
        var selectDay: String = getToday()
        
        var routineList: [RoutineList]?
    }
    
    public enum Action: Equatable {
    
        case onTapAiAddRoutineButton
        case onTapAddRoutineButton
        case onTapDeleteButton
        case onTapDayButton(day: String)
        case onTapRoutineCard(id: Int, exercise: String)
        case onTapCompletedButton(id: Int)
        case getRoutineList(day: String)
        case routineListDataReceived(TaskResult<[RoutineList]>)
    }
    
    @Dependency(\.sideEffect.routine) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapAiAddRoutineButton:
                sideEffect.onTapAiAddRoutineButton()
                return .none
                
            case .onTapAddRoutineButton:
                sideEffect.onTapAddRoutineButton()
                return .none
                
            case .onTapDeleteButton:
                let day = state.selectDay
                sideEffect.onTapDeleteButton(day) {
                    Task {
                        await deleteAllRoutineCard(day: getEnglishDayFullName(day))
                    }
                }
                return .none
                
            case .onTapDayButton(let day):
                state.selectDay = day
                return .none
                
            case .onTapRoutineCard(let id, let exercise):
                sideEffect.onTapRoutineCard(exercise) {
                    Task {
                        await deleteRoutineCard(id: id)
                    }
                }
                return .none
                
            case .onTapCompletedButton(let id):
                sideEffect.onTapCompletedButton {
                    Task {
                        await putCompleteRoutine(id: id)
                    }
                }
                return .none
                
            case .getRoutineList(let day):
                return .run { send in
                    
                    await send(.routineListDataReceived(
                        TaskResult { try await
                            getRoutineList(day: getEnglishDayFullName(day))
                        })
                    )
                }
                
            case let .routineListDataReceived(.success(response)):
                state.routineList = response
                return .none
                
            case .routineListDataReceived(.failure):
                return .none
            }
        }
    }
    
    func deleteRoutineCard(id: Int) async {
        
        do {
            print(try await Service.request("\(API.routine_delete)/\(id)", .delete))
        } catch {
            await MainActor.run {
                sideEffect.onFailDeleteRoutineCard()
            }
        }
    }
    
    func deleteAllRoutineCard(day: String) async {
        
        do {
            print(try await Service.request("\(API.routine_delete)?dayOfWeek=\(day)" ,.delete))
        } catch {
            await MainActor.run {
                sideEffect.onFailDeleteRoutineCard()
            }
        }
    }
    
    func putCompleteRoutine(id: Int) async {
        
        do {
            print(try await Service.request("\(API.routine_isComplete)/\(id)", .put, DataResponse<Bool>.self).data)
        } catch {
            print(error.localizedDescription)
            await MainActor.run {
                sideEffect.onFailPutCompleteRoutine()
            }
        }
    }
    
    func getRoutineList(day: String) async throws -> [RoutineList] {
        
        let params = ["dayOfWeek": day]
        do {
            let response = try await Service.request(API.routine_list, .get, params: params, DataResponse<[RoutineList]>.self)
            return response.data
        } catch (let error) {
            print(error.localizedDescription)
            throw error
        }
    }
}

public struct RoutineList: Codable, Equatable, Identifiable, Hashable {
    
    public let id: Int
    let exerciseName: String
    let targetMuscle: [String]
    let reps, sets, restTime: Int
    let completed: Bool?
}
