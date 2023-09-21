//
//  SetRoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/21.
//

import ComposableArchitecture

public struct SetRoutine: Reducer{
    
    public struct State: Equatable {
        
        var day: String = ""
        
        var selectedDay: String = ""
        
        var selectMuscle: String = ""
        
        var exerciseName: String = "PUSH_UP"
        
        var isSelectedDay: Bool = false
        
        var isSelectedMuscle: Bool = false
        
        var isSelectedExercize: Bool = false
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onTapNextButton
        case onSelectDayButton(day: String)
        case onSelectMuscleButton(muscle: String)
        case onSelectExerciseButton(exercise: String)
    }
    
    @Dependency(\.sideEffect.setRoutine) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(getEnglishDayFullName(state.day), state.exerciseName)
                return .none
                
            case .onSelectDayButton(let day):
                state.day = day
                state.selectedDay = day
                state.isSelectedDay = true
                return .none
                
            case .onSelectMuscleButton(let muscle):
                state.selectMuscle = muscle
                state.isSelectedMuscle = true
                return .none
                
            case .onSelectExerciseButton(let exercise):
                state.exerciseName = exercise
                state.isSelectedExercize = true
                return .none
            }
        }
    }
}
