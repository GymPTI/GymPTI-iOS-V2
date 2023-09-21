//
//  SelectGoalCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/14.
//

import ComposableArchitecture

public struct SelectGoal: Reducer {
    
    public struct State: Equatable {
        
        var goal: String = ""
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapNextButton
        case onSelectGoalButton(goal: String)
    }
    
    @Dependency(\.sideEffect.selectGoal) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(state.goal)
                return .none
                
            case .onSelectGoalButton(let goal):
                state.goal = goal
                return .none
            }
        }
    }
}

