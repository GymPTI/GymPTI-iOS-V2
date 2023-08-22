//
//  StartCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/18.
//

import ComposableArchitecture

public struct Start: Reducer {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapSignInButton
        case onTapSignUpButton
    }
    
    @Dependency(\.sideEffect.start) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapSignInButton:
                sideEffect.onTapSignInButton()
                return .none
                
            case .onTapSignUpButton:
                sideEffect.onTapSignUpButton()
                return .none
            }
        }
    }
}
