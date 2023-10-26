//
//  DecideAiRoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/25/23.
//

import ComposableArchitecture

public struct DecideAiRoutine: Reducer{
    
    public struct State: Equatable {
        
        var routineList: ExerciseResult?
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapDecideButton
        case getAiRoutineList
        case routineListDataReceived(TaskResult<ExerciseResult>)
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
    
    func getAiRoutineList() async throws -> ExerciseResult {
        
        let params: [String : [String]] = ["targetExercise": ["CHEST", "BACK"]]
        
        do {
            let response = try await Service.request(API.routine_aicreate, .post, params: params, DataResponse<ExerciseResult>.self)
            print(response.data)
            return response.data
        } catch let error {
            print(error)
            await MainActor.run {
                sideEffect.onFailGetAiRoutineList()
            }
            throw error
        }
    }
}

public struct ExerciseResult: Codable, Equatable {
    let result: [Exercise]
}

public struct Exercise: Codable, Equatable {
    let sets: String
    let restTime: String
    let reps: String
    let exerciseName: String
}
