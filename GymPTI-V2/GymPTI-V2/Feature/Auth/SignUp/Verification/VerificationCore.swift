//
//  VerificationCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import ComposableArchitecture

public struct Verification: Reducer {
    
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
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapVerificationButton:
                let newState = state
                Task {
                    await sendValidateMailVerification(state: newState)
                }
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
            }
        }
    }
    
    func sendValidateMailVerification(state: State) async {
        
        let params = [
            "email": state.email,
            "emailVerificationCode": state.emailVerificationCode
        ]
        
        do {
            let result = try await Service.request(API.email_validateMailVerification, .post,params: params)
            if (200..<299).contains(result.status) {
                
                let params = [
                    "userId": state.id,
                    "nickname": state.name,
                    "email": state.email,
                    "password": state.pw.hashedPassword()
                ]
                
                print(try await Service.request(API.auth_register, .post, params: params))
            }
        } catch {
            await MainActor.run {
                sideEffect.failVerification()
            }
        }
    }
}
