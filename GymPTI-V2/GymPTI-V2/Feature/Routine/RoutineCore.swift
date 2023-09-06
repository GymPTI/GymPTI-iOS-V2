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
        case onAppearRoutineView
        case userDataReceived(TaskResult<User>)
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
                
            case .onAppearRoutineView:
                let today = getToday()
                state = State(selectDay: today)
                return .run { send in
                    
                    await send(.userDataReceived(
                        TaskResult { try await
                            getRoutineData(day: "")
                        })
                    )
                }
                
            case let .userDataReceived(.success(response)):
                return .none
                
            case .userDataReceived(.failure):
                return .none
            }
        }
    }
    
    func getRoutineData(day: String) async throws -> User {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            Requests.request("/user/my", .get, User.self) { error in
                print("에러: \(day)")
            } completion: { user in
                continuation.resume(returning: user)
            }
        }
    }
}
