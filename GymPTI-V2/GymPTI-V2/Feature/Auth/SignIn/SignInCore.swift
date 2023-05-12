//
//  SignInCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture

public struct SignIn: ReducerProtocol {
    
    public struct State: Equatable {
        
        public init(id: String, pw: String) {
            self.id = id
            self.pw = pw
        }
        
        @BindingState var id: String = ""
        @BindingState var pw: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapSignInButton
        case onTapSignUpButton
    }
    
    @Dependency(\.sideEffect.signIn) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        BindingReducer()
        Reduce { state, action in
            switch action {
                
            case .binding:
                return .none
                
            case .onTapSignInButton:
                loginRequest(state)
                return .none
                
            case .onTapSignUpButton:
                sideEffect.onTapSignUpButton()
                return .none
            }
        }
    }
    
    private func loginRequest(_ state: State) {
        
        let params = [
            "userId": state.id,
            "password": hashedPassword(state.pw)
        ]
        
        Requests.request("/auth/login", .post, params: params, token.self ,failure: {
            
        }) { data in
            Token.save(.accessToken, data.accessToken)
            Token.save(.refreshToken, data.refreshToken)
            sideEffect.onTapSignInButton()
        }
        
    }
}

struct token: Codable {
    
    let accessToken, refreshToken: String
}
