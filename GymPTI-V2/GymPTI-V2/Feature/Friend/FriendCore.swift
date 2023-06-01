//
//  FriendCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import ComposableArchitecture

public struct Friend: ReducerProtocol {
    
    public struct State: Equatable {
        
        var cellCnt: Int = 5
    }
    
    public enum Action: Equatable {
        
        case onTapNotificationButton
        case onTapSettingButton
    }
    
    @Dependency(\.sideEffect.friend) var sideEffect
    
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

