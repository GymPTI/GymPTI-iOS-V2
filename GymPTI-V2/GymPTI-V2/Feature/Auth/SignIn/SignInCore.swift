//
//  SignInCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture

public struct SignIn: Reducer {
    
    public struct State: Equatable {
        
        @BindingState var id: String = ""
        
        @BindingState var pw: String = ""
        
        var isLoging: Bool = false
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapSignInButton
    }
    
    @Dependency(\.sideEffect.signIn) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapSignInButton:
                let state = state
                Task {
                    await postLoginRequest(state: state)
                }
                return .none
            }
        }
    }
    
    func postLoginRequest(state: State) async {
        
        let params: [String: Any] = [
            "userId": state.id,
            "password": state.pw.hashedPassword()
        ]
        
        do {
            let response = try await Service.request("/auth/login", .post, params: params, Response<AccessToken>.self)
            
            await MainActor.run {
                Token.save(.accessToken, response.data.accessToken)
                Token.save(.refreshToken, response.data.refreshToken)
                sideEffect.onSuccessSignIn()
            }
            
        } catch let error {
            await MainActor.run {
                sideEffect.onFailSignIn()
                print(error)
            }
        }
    }
}

struct AccessToken: Codable {
    
    let accessToken, refreshToken: String
}
