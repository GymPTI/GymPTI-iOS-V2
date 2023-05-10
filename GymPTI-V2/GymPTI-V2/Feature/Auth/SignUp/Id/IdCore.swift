//
//  IdCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture

public struct Id: ReducerProtocol {
    
    public struct State: Equatable {
        
        @BindingState var id: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapNextButton
    }
    
    @Dependency(\.sideEffect.id) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .binding:
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(state.id)
                return .none
            }
        }
    }
}
