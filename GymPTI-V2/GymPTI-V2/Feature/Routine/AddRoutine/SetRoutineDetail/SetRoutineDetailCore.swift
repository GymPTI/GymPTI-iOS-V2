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
        
        var restTime: Int = 1
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapAddButton
        case onTapPlusRepsButton
        case onTapMinusRepsButton
        case onTapPlusSetsButton
        case onTapMinusSetsButton
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
                        await postRoutineCard(state: state)
                    }
                }
                return .none
                
            case .onTapPlusRepsButton:
                state.reps += 1
                return .none
                
            case .onTapMinusRepsButton:
                state.reps -= 1
                return .none
                
            case .onTapPlusSetsButton:
                state.sets += 1
                return .none
                
            case .onTapMinusSetsButton:
                state.sets -= 1
                return .none
            }
        }
    }
    
    func postRoutineCard(state: State) async {
        
        let params: [String: Any] = [
            "exercise": "PUSH_UP",
            "dayOfWeek": getEnglishDayFullName(state.day),
            "reps": state.reps,
            "sets": state.sets,
            "restTime": state.restTime
        ]
        
        print(params)
        
        do {
            let response = try await Service.request("/routine/create", .post, params: params ,ErrorResponse.self)
            print(response)
        } catch {
            print("response")
        }
    }
}

