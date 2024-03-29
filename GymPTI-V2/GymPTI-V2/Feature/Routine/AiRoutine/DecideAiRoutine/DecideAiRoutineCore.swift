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
        
        var day: String = ""
        
        var selectedDay: String = ""
        
        var isCreateAiRoutine: Bool {
            if routineList == nil {
                return true
            }
            return false
        }
        var routineList: ExerciseResult?
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapDecideButton
        case onTapRecreateButton
        case onSelectDayButton(day: String)
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
                let newState = state
                Task {
                    await PostAiRoutineList(state: newState)
                }
                sideEffect.onTapDecideButton()
                return .none
                
            case .onTapRecreateButton:
                sideEffect.onTapRecreateButton()
                return .none
                
            case .onSelectDayButton(let day):
                state.day = day
                state.selectedDay = day
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
            print("루틴 데이터 :\n\(response)")
            await MainActor.run {
                sideEffect.onSuccessGetAiRoutineList()
            }
            return response.data
        } catch let error {
            await MainActor.run {
                sideEffect.onFailGetAiRoutineList()
            }
            throw error
        }
    }
    
    private func PostAiRoutineList(state: State) async {
        
        for i in 0 ..< ((state.routineList?.result.count)!) {
            
            let params: [String: Any] = [
                "exercise": state.routineList?.result[i].exerciseName ?? "",
                "dayOfWeek": getEnglishDayFullName(state.day),
                "reps": state.routineList?.result[i].reps ?? "",
                "sets": state.routineList?.result[i].sets ?? "",
                "restTime": state.routineList?.result[i].restTime ?? ""
            ]
            print(params)
            do {
                print(try await Service.request(API.routine_create, .post, params: params))
            } catch {
                await MainActor.run {
                    sideEffect.onFailPostAiRoutineList()
                }
            }
        }
    }
    
    private func muscleToEng(_ muscle: String) -> String {
        let muscleMap: [String: String] = ["가슴": "CHEST", "등": "BACK", "팔": "ARM", "하체": "LEGS", "어깨": "SHOULDER", "복근": "ABS"]
        return muscleMap[muscle] ?? ""
    }
}

public struct ExerciseResult: Codable, Equatable, Hashable {
    let result: [Exercise]
}

public struct Exercise: Codable, Equatable, Hashable {
    let sets, reps, restTime: Int
    let exerciseName: String
}
