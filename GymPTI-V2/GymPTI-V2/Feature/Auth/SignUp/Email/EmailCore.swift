//
//  EmailCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture
import CryptoKit

public struct Email: Reducer {
    
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
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapSendEmailButton:
                state.isSendEmail = true
                let newState = state
                Task {
                    await sendEmailRequest(state: newState)
                }
                return .none
            }
        }
    }
    
    func sendEmailRequest(state: State) async {
        
        let params = ["email": state.email]
        
        do {
            _ = try await Service.request("/email/sendMailVerification", .post,params: params, ErrorResponse.self)
            await MainActor.run {
                sideEffect.onSucessSendEmail(state.id, state.pw, state.name, state.email)
            }
        } catch let error {
            await MainActor.run {
                sideEffect.onFailSendEmail()
            }
            print(error.localizedDescription)
        }
    }
    
}
