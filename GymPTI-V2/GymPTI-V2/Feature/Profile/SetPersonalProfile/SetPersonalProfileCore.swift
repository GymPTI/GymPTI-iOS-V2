//
//  SetPersonalProfileCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/27.
//

import ComposableArchitecture

public struct SetPersonalProfile: Reducer {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
    }
    
    @Dependency(\.sideEffect.setPesronalProfile) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
            }
        }
    }
}
