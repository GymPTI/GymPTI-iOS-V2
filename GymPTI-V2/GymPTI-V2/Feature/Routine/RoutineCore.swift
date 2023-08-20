//
//  RoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import ComposableArchitecture

public struct Routine: ReducerProtocol {
    
    public struct State: Equatable {
        
    }
    
    public enum Action: Equatable {
        
        case onTapAiAddRoutineButton
        case onTapAddRoutineButton
    }
    
    @Dependency(\.sideEffect.routine) var sideEffect
    
    public var body: some ReducerProtocol<State, Action> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapAiAddRoutineButton:
                sideEffect.onTapAiAddRoutineButton()
                return .none
                
            case .onTapAddRoutineButton:
                sideEffect.onTapAddRoutineButton()
                return .none
            }
        }
    }
}

