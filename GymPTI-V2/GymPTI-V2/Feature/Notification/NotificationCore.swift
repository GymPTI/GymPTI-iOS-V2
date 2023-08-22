//
//  NotificationCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/31.
//

import ComposableArchitecture

public struct Notification: Reducer {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapEditAccountButton
        case onTapLogoutButton
        case onTapBackButton
    }
    
    @Dependency(\.sideEffect.notification) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
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
