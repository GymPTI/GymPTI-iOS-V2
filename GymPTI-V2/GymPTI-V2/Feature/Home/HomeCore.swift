//
//  HomeCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture
import Combine

public struct Home: ReducerProtocol {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapNotificationButton
        case onTapSettingButton
    }
    
    @Dependency(\.sideEffect.home) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapNotificationButton:
                sideEffect.onTapNotificationButton()
                return .none
                
            case .onTapSettingButton:
                sideEffect.onTapSettingButton()
                return .none
            }
        }
    }
}
