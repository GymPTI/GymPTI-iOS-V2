//
//  RoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture

public struct Routine: Reducer {
    
    public struct State: Equatable {
        
        var selectDay: String = ""
        
        var routineList: [RoutineList]? = nil
        
        var isDeleteRoutineCell: Bool = false
        
        var isSelected: Bool = false
    }
    
    public enum Action: Equatable {
        
        case onTapAiAddRoutineButton
        case onTapAddRoutineButton
        case onTapSunButton
        case onTapMonButton
        case onTapTheButton
        case onTapWenButton
        case onTapThuButton
        case onTapFriButton
        case onTapSatButton
        case onSelectDay
        case onTapRoutineCell(id: Int)
        case onAppearRoutineView
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
                
            case .onTapSunButton:
                state.selectDay = "일"
                return .none
                
            case .onTapMonButton:
                state.selectDay = "월"
                return .none
                
            case .onTapTheButton:
                state.selectDay = "화"
                return .none
                
            case .onTapWenButton:
                state.selectDay = "수"
                return .none
                
            case .onTapThuButton:
                state.selectDay = "목"
                return .none
                
            case .onTapFriButton:
                state.selectDay = "금"
                return .none
                
            case .onTapSatButton:
                state.selectDay = "토"
                return .none
                
            case .onTapRoutineCell(let id):
                state.isDeleteRoutineCell = false
                sideEffect.onTapRoutineCell() {
                    
                    Task {
                        await deleteRoutineCell(id: id)
                    }
                }
                state.isDeleteRoutineCell = true
                return .none
                
            case .onSelectDay:
                let selectDay = state.selectDay
                return .run { send in
                    
                    await send(.routineListDataReceived(
                        TaskResult { try await
                            getRoutineList(day: getEnglishDayFullName(selectDay))
                        })
                    )
                }
                
            case .onAppearRoutineView:
                let today = getToday()
                state = State(selectDay: today)
                return .run { send in
                    
                    await send(.routineListDataReceived(
                        TaskResult { try await
                            getRoutineList(day: getEnglishDayFullName(today))
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
    
    func deleteRoutineCell(id: Int) async {
        
        do {
            let response = try await Service.request("/routine/delete/\(id)", .delete, ErrorResponse.self)
            print(response)
        } catch {
            print("response")
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
