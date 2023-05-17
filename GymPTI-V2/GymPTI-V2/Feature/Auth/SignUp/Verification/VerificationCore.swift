//
//  VerificationCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import ComposableArchitecture

public struct Verification: ReducerProtocol {
    
    public struct State: Equatable {
        
        var id: String = ""
        var pw: String = ""
        var name: String = ""
        var email: String = ""
        
        @BindingState var emailVerificationCode: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapVerificationButton
    }
    
    @Dependency(\.sideEffect.verification) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapVerificationButton:
                sendSignUpRequest(state: state)
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
            }
        }
    }
    
    private func sendSignUpRequest(state: State) {
        
        let params = [
            "userId": state.id,
            "nickname": state.name,
            "email": state.email,
            "password": hashedPassword(state.pw)
        ]
        
        Requests.simple("/email/validateMailVerification", .post, params: ["email": state.email, "emailVerificationCode": state.emailVerificationCode], failure : { message in
            
            sideEffect.failVerification(message)
        }) {
            
            Requests.simple("/auth/register", .post, params: params, failure : { message in
                
                sideEffect.failSignUp(message)
            }) {
                sideEffect.sucessSignUp()
            }
        }
    }
    
}
