//
//  SetRoutineDetailCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/05.
//

import ComposableArchitecture

public struct SetRoutineDetail: Reducer {
    
    public struct State: Equatable {
        
        var day: String = ""
        
        var exerciseName: String = ""
        
        @BindingState var reps: Int = 1
        
        @BindingState var sets: Int = 1
        
        @BindingState var restTime: Int = 1
    }
    
    public enum Action: Equatable, BindableAction {
        
        case binding(BindingAction<State>)
        case onTapBackButton
        case onTapAddButton
    }
    
    @Dependency(\.sideEffect.setRoutineDetail) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        BindingReducer()
        Reduce { state, action in
            
            switch action {
                
            case .binding:
                return .none
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapAddButton:
//                sideEffect.onTapAddButton()
                print(state.day, state.exerciseName)
                return .none
            }
        }
    }
}

