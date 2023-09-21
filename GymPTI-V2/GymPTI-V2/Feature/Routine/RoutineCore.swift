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

        var routineList: [RoutineList]? = nil
        
        var isSelected: Bool = false
        
        var isDeleted: Bool = false
    }
    
    public enum Action: Equatable {
        
        case onTapAiAddRoutineButton
        case onTapAddRoutineButton
        case onTapDayButton(day: String)
        case onTapRoutineCard(id: Int, exercise: String)
        case onTapCompletedButton
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
                
            case .onTapDayButton(let day):
                state.selectDay = day
                return .none
                
            case .onTapRoutineCard(let id, let exercise):
                sideEffect.onTapRoutineCard(exercise) {
                    Task {
                        await deleteRoutineCard(id: id)
                    }
                }
                state.isDeleted = true
                return .none
                
            case .onTapCompletedButton:
                sideEffect.onTapCompletedButton {
                    Task {
                        
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
            let response = try await Service.request("/routine/delete/\(id)", .delete, ErrorResponse.self)
            print(response)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
    func getRoutineList(day: String) async throws -> [RoutineList] {
        
        let params: [String: Any] = ["dayOfWeek": day]
        
        let response = try await Service.request(
            "/routine/list", .get,
            params: params,[RoutineList].self)
        
        return response
    }
}

public struct RoutineList: Codable, Equatable, Identifiable, Hashable {

    public let id: Int
    let exerciseName: String
    let targetMuscle: [String]
    let reps, sets, restTime: Int
    let completed: Bool
}
