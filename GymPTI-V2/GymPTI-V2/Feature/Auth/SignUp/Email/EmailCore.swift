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
        @BindingState var emailVerificationCode: String = ""
        
        var isSendEmail: Bool = false
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapSendEmailButton
        case onTapVerificationButton
    }
    
    @Dependency(\.sideEffect.email) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapSendEmailButton:
                sendEmailRequest(state: state)
                state.isSendEmail = true
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
    
    private func sendEmailRequest(state: State) {
        
        Requests.simple("/auth/sendMailVerification", .post, params: ["email": state.email], failure: {
            sideEffect.failSendEmail()
        }) {
            sideEffect.sucessSendEmail(state.email)
        }
    }
    
    private func sendSignUpRequest(state: State) {
        
        let params = [
            "userId": state.id,
            "nickname": state.name,
            "email": state.email,
            "password": SHA512.hash(data: state.pw.data(using: .utf8)!)
                .compactMap { String(format: "%02x", $0) }.joined()
                .uppercased()]
        
        Requests.simple("/auth/validateMailVerification", .post, params: ["email": state.email, "emailVerificationCode": state.emailVerificationCode], failure: {
            sideEffect.fail()
        }) {
            Requests.simple("/auth/register", .post, params: params, failure: {
                sideEffect.fail2()
            }) {
                sideEffect.sucessSignUp()
            }
        }
    }
    
}
