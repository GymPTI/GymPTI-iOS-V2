//
//  FriendCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import ComposableArchitecture

public struct Friend: Reducer {
    
    public struct State: Equatable {
        
        var cellCnt: Int = 5
    }
    
    public enum Action: Equatable {
        
        case onTapNotificationButton
        case onTapSettingButton
    }
    
    @Dependency(\.sideEffect.friend) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
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

