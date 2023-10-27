//
//  DecideAiRoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/25/23.
//

import ComposableArchitecture

public struct DecideAiRoutine: Reducer{
    
    public struct State: Equatable {
        
        var selectMuscle: String
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
                let newState = state
                return .run { send in
                    await send(.routineListDataReceived(
                        TaskResult { try await
                            getAiRoutineList(state: newState)
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
    
    private func getAiRoutineList(state: State) async throws -> ExerciseResult {
        
        let muscleArray = state.selectMuscle.components(separatedBy: ", ")
        let muscleArraytoEng = muscleArray.map { muscleToEng($0) }
        let params: [String : [String]] = ["targetExercise": muscleArraytoEng]
        do {
            let response = try await Service.request(API.routine_aicreate, .post, params: params, DataResponse<ExerciseResult>.self)
            return response.data
        } catch let error {
            await MainActor.run {
                sideEffect.onFailGetAiRoutineList()
            }
            throw error
        }
    }
    
    private func muscleToEng(_ muscle: String) -> String {
        let muscleMap: [String: String] = ["가슴": "CHEST", "등": "BACK", "팔": "ARM", "하체": "LEGS", "어꺠": "SHOULDER", "복근": "ABS"]
        return muscleMap[muscle] ?? ""
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
