//
//  SetPersonalProfileCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/27.
//

import ComposableArchitecture

public struct SetPersonalProfile: Reducer {
    
    public struct State: Equatable {
        
        var sex: String = ""
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapMaleButton
        case onTapFemaleButton
    }
    
    @Dependency(\.sideEffect.setPesronalProfile) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapMaleButton:
                state.sex = "male"
                return .none
                
            case .onTapFemaleButton:
                state.sex = "female"
                return .none
            }
        }
    }
}
