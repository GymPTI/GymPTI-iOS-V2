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
        
        case tabButton
    }
    
    @Dependency(\.sideEffect.routine) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .tabButton:
                sideEffect.tabButton()
                return .none
            }
        }
    }
}
