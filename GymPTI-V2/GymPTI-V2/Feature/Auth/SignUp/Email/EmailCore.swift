//
//  EmailCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture
import CryptoKit

public struct Email: ReducerProtocol {
    
    public struct State: Equatable {
        
        var id: String = ""
        var pw: String = ""
        var name: String = ""
        @BindingState var email: String = ""
        
        var isSendEmail: Bool = false
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapSendEmailButton
    }
    
    @Dependency(\.sideEffect.email) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapSendEmailButton:
                sendEmailRequest(state: state)
                return .none
            }
        }
    }
    
    private func sendEmailRequest(state: State) {
        
        Requests.simple("/auth/sendMailVerification", .post, params: ["email": state.email], failure : { message in
            
            print(message)
        }) {
            sideEffect.sucessSendEmail(state.id, state.pw, state.name, state.email)
        }
    }
    
}
