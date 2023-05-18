//
//  SettingCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture

public struct Setting: ReducerProtocol {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapEditAccountButton
        case onTapLogoutButton
        case onTapBackButton
    }
    
    @Dependency(\.sideEffect.setting) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapEditAccountButton:
                sideEffect.onTapEditAccountButton()
                return .none
                
            case .onTapLogoutButton:
                sideEffect.onTapLogoutButton()
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
            }
        }
    }
}
