//
//  EditAccountCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture
import CryptoKit

public struct EditAccount: Reducer {
    
    public struct State: Equatable {
        
        @BindingState var oldPassword: String = ""
        @BindingState var newPassword: String = ""
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapChangeButton
    }
    
    @Dependency(\.sideEffect.editAccount) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapChangeButton:
                chagePassword(state: state)
                return .none
            }
        }
    }
    
    private func chagePassword(state: State) {
        
        let params = [
            "oldPassword": state.oldPassword.hashedPassword(),
            "newPassword": state.newPassword.hashedPassword()
        ]
        
        Requests.simple("/user/password", .put, params: params, failure: { message in
            print(message)
        }) {
            print("비번 변경 성공")
        }
    }
}
