//
//  SelectDayCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import ComposableArchitecture

public struct SelectDay: Reducer {
    
    public struct State: Equatable {
        
        var day: String = ""
        
        var selectedDay: String = ""

        var isSelected: Bool = false
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapNextButton
        case onSelectDayButton(day: String)
    }
    
    @Dependency(\.sideEffect.selectDay) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(state.day)
                return .none
                
            case .onSelectDayButton(let day):
                state.day = day
                state.selectedDay = day
                state.isSelected = true
                return .none
            }
        }
    }
}

