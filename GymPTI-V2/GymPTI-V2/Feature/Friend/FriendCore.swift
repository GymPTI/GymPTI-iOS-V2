//
//  FriendCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import ComposableArchitecture

public struct Friend: ReducerProtocol {
    
    public struct State: Equatable {
        
        var cellCnt: Int = 0
    }
    
    public enum Action: Equatable {
        
        case tabButton1
        case tabButton2
    }
    
    @Dependency(\.sideEffect.friend) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .tabButton1:
                state.cellCnt += 1
                return .none
                
            case .tabButton2:
                if state.cellCnt > 0 {
                    state.cellCnt -= 1
                }
                return .none
            }
        }
    }
}

