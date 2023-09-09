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
        
        var exerciseName: String = ""
        
        var isSelected: Bool = false
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapNextButton
        case onSelectExerciseButton(exercise: String)
    }
    
    @Dependency(\.sideEffect.selectTargetMuscle) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(state.day, state.exerciseName)
                return .none
                
            case .onSelectExerciseButton(let exercise):
                state.exerciseName = exercise
                state.isSelected = true
                return .none
            }
        }
    }
}

