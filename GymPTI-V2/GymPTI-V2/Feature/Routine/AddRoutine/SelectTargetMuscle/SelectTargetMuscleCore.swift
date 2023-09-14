//
//  SelectTargetMuscleCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/04.
//

import ComposableArchitecture

public struct SelectTargetMuscle: Reducer {
    
    public struct State: Equatable {
        
        var day: String = ""
        
        var selectMuscle: String = ""
        
        var exerciseName: String = "PUSH_UP"
        
        var isSelected: Bool = false
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapNextButton
        case onSelectMuscleButton(muscle: String)
    }
    
    @Dependency(\.sideEffect.selectTargetMuscle) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(state.day, state.exerciseName)
                return .none
                
            case .onSelectMuscleButton(let muscle):
                state.selectMuscle = muscle
                state.isSelected = true
                return .none
            }
        }
    }
}

