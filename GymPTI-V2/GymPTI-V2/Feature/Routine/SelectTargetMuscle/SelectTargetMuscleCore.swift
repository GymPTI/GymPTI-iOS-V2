//
//  SelectTargetMuscleCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/04.
//

import ComposableArchitecture

public struct SelectTargetMuscle: Reducer {
    
    public struct State: Equatable {
        
        @BindingState var targetMuscle: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapNextButton
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
                sideEffect.onTapNextButton()
                return .none
            }
        }
    }
}

