//
//  SetRoutineDetailCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/05.
//

import ComposableArchitecture

public struct SetRoutineDetail: Reducer {
    
    public struct State: Equatable {
        
        var day: String = ""
        
        var exerciseName: String = ""
        
        var reps: Int = 1
        
        var sets: Int = 1
        
        var restTime: Int = 15
    }
    
    public enum Action: Equatable {
    
        case onTapBackButton
        case onTapAddButton
        case onTapPlusRepsButton
        case onTapMinusRepsButton
        case onTapPlusSetsButton
        case onTapMinusSetsButton
        case onSelectRestTimeButton(time: Int)
    }
    
    @Dependency(\.sideEffect.setRoutineDetail) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapAddButton:
                let state = state
                sideEffect.onTapAddButton {
                    
                    Task {
                        await postRoutineCreateRequest(state: state)
                    }
                    sideEffect.sucessRequest()
                }
                return .none
                
            case .onTapPlusRepsButton:
                state.reps += 1
                return .none
                
            case .onTapMinusRepsButton:
                if state.reps > 1 {
                    state.reps -= 1
                }
                return .none
                
            case .onTapPlusSetsButton:
                state.sets += 1
                return .none
                
            case .onTapMinusSetsButton:
                if state.sets > 1 {
                    state.sets -= 1
                }
                return .none
                
            case .onSelectRestTimeButton(let time):
                state.restTime = time
                return .none
            }
        }
    }
    
    func postRoutineCreateRequest(state: State) async {

        let params: [String: Any] = [
            "exercise": state.exerciseName,
            "dayOfWeek": getEnglishDayFullName(state.day),
            "reps": state.reps,
            "sets": state.sets,
            "restTime": state.restTime
        ]
        
        print(params)
        
        do {
            let response = try await Service.request("/routine/create", .post, params: params ,ErrorResponse.self)
            sideEffect.sucessRequest()
            print(response)
        } catch {
            print("오류 발생 : \(error.localizedDescription)")
        }
    }
}

