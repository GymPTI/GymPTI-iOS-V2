//
//  EmailCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture

public struct Email: ReducerProtocol {
    
    public struct State: Equatable {
        
        var id: String = ""
        var pw: String = ""
        var name: String = ""
        @BindingState var email: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapSendEmailButton
    }
    
    @Dependency(\.sideEffect.email) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .binding:
                return .none
                
            case .onTapSendEmailButton:
                sideEffect.sucessSendEmail(state.email)
                return .none
            }
        }
    }
    
}
