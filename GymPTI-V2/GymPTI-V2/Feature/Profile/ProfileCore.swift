//
//  ProfileCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture

public struct Profile: ReducerProtocol {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapEditInfoButton
        case onTapEditAccountButton
    }
    
    @Dependency(\.sideEffect.profile) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapEditInfoButton:
                sideEffect.onTapEditInfoButton()
                return .none
                
            case .onTapEditAccountButton:
                sideEffect.onTapEditAccountButton()
                return .none
            }
        }
    }
}
