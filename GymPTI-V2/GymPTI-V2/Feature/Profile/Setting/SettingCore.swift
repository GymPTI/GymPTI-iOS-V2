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
        
        case onTapLogoutButton
        case onTapBackButton
        case onTapFindIdButton
    }
    
    @Dependency(\.sideEffect.setting) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapLogoutButton:
                sideEffect.onTapLogoutButton()
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapFindIdButton:
                sideEffect.onTapFindIdButton()
                return .none
            }
        }
    }
}
