//
//  HomeCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import ComposableArchitecture
import Combine

public struct Home: Reducer {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapNotificationButton
        case onTapSettingButton
        case onTapDummyView
    }
    
    @Dependency(\.sideEffect.home) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapNotificationButton:
                sideEffect.onTapNotificationButton()
                return .none
                
            case .onTapSettingButton:
                sideEffect.onTapSettingButton()
                return .none
                
            case .onTapDummyView:
                sideEffect.onTapDummyView()
                return .none
            }
        }
    }
}
