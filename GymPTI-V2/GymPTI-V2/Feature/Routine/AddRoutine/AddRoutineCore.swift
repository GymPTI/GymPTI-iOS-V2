//
//  AddRoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import ComposableArchitecture

public struct AddRoutine: Reducer {
    
    public struct State: Equatable {
        
        @BindingState var excersizeName: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapAddButton
    }
    
    @Dependency(\.sideEffect.addRoutine) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapAddButton:
                sideEffect.onTapAddButton()
                return .none
            }
        }
    }
}

