//
//  DecideAiRoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/25/23.
//

import ComposableArchitecture

public struct DecideAiRoutine: Reducer{
    
    public struct State: Equatable {
        
        var routineList: [RoutineResult]? = [RoutineResult(id: 1, exercisename: "푸쉬업", resttime: "1", reps: "1", sets: "1")]
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapDecideButton
        case getAiRoutineList
        case routineListDataReceived(TaskResult<[RoutineResult]>)
    }
    
    @Dependency(\.sideEffect.decideAiRoutine) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapDecideButton:
                sideEffect.onTapDecideButton()
                return .none
                
            case .getAiRoutineList:
                return .run { send in
                    
                    await send(.routineListDataReceived(
                        TaskResult { try await
                            getAiRoutineList()
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
    
    func getAiRoutineList() async throws -> [RoutineResult] {
        
        let params: [String : Any] = ["targetExercise": ["CHEST", "BACK"], "wantExercise": ""]
        
        do {
            let response = try await Service.request(API.routine_aicreate, .post, params: params, DataResponse<[RoutineResult]>.self)
            return response.data
        } catch let error {
            await MainActor.run {
                sideEffect.onFailGetAiRoutineList()
            }
            throw error
        }
    }
}

public struct RoutineResult: Codable, Equatable, Identifiable, Hashable {
    
    public let id: Int
    let exercisename, resttime, reps, sets: String
}
