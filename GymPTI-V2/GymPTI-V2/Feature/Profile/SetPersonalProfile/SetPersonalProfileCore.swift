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
        
        @BindingState var age: Int = 0
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapMaleButton
        case onTapFemaleButton
        case onTapAgeButton
    }
    
    @Dependency(\.sideEffect.setPesronalProfile) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapMaleButton:
                state.sex = "male"
                return .none
                
            case .onTapFemaleButton:
                state.sex = "female"
                return .none
                
            case .onTapAgeButton:
                return .none
            }
        }
    }
}
