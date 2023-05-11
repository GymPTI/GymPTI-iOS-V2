//
//  NameCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture

public struct Name: ReducerProtocol {
    
    public struct State: Equatable {
        
        var id: String = ""
        var pw: String = ""
        @BindingState var name: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapNextButton
        case onTapBackButton
    }
    
    @Dependency(\.sideEffect.name) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .binding:
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(state.id, state.pw, state.name)
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
            }
        }
    }
}
