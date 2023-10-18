//
//  AddAiRoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import ComposableArchitecture

public struct AddAiRoutine: Reducer{
    
    public struct State: Equatable {
        
        var selectMuscle: String = ""
        
        var exerciseName: String = "PUSH_UP"
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
    }
    
    @Dependency(\.sideEffect.addAiRoutine) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
            }
        }
    }
}
