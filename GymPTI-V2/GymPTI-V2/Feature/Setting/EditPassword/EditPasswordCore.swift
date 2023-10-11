//
//  EditPasswordCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture
import CryptoKit

public struct EditPassword: Reducer {
    
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
                let newState = state
                Task {
                    await putUserPassword(state: newState)
                }
                return .none
            }
        }
    }
    
    func putUserPassword(state: State) async {
        
        let params = [
            "oldPassword": state.oldPassword.hashedPassword(),
            "newPassword": state.newPassword.hashedPassword()
        ]
        
        do {
            _ = try await Service.request("/user/password", .put, params: params)
            
            await MainActor.run {
                sideEffect.onSuccessPutUserPassword()
            }
        } catch {
            await MainActor.run {
                sideEffect.onFailPutUserPassword()
            }
        }
    }
}
