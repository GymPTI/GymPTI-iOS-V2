//
//  AddAiRoutineCore.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import ComposableArchitecture

public struct AddAiRoutine: Reducer {
    
    public struct State: Equatable {
        
        var selectMuscle: [String] = []
        
        var isSelectChestMuscle: Bool = false
        
        var isSelectBackMuscle: Bool = false
        
        var isSelectArmMuscle: Bool = false
        
        var isSelectLegsMuscle: Bool = false
        
        var isSelectShoulderMuscle: Bool = false
        
        var isSelectAbsMuscle: Bool = false
        
        var isSelectMuscle: Bool {
            return selectMuscle != []
        }
    }
    
    public enum Action: Equatable {
        
        case onTapBackButton
        case onSelectChestMuscle
        case onSelectBackMuscle
        case onSelectArmMuscle
        case onSelectLegsMuscle
        case onSelectShoulderMuscle
        case onSelectAbsMuscle
        case onTapNextButton
    }
    
    @Dependency(\.sideEffect.addAiRoutine) var sideEffect
    
    public var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            let isMuscleLimitExceeded = state.selectMuscle.count >= 3
            
            switch action {
                
            case .onTapBackButton:
                sideEffect.onTapBackButton()
                return .none
                
            case .onSelectChestMuscle:
                if !isMuscleLimitExceeded || state.isSelectChestMuscle {
                    state.selectMuscle = addMuscle("가슴", to: state.selectMuscle)
                    state.isSelectChestMuscle.toggle()
                }
                return .none
                
            case .onSelectBackMuscle:
                if !isMuscleLimitExceeded || state.isSelectBackMuscle {
                    state.selectMuscle = addMuscle("등", to: state.selectMuscle)
                    state.isSelectBackMuscle.toggle()
                }
                return .none
                
            case .onSelectArmMuscle:
                if !isMuscleLimitExceeded || state.isSelectArmMuscle {
                    state.selectMuscle = addMuscle("팔", to: state.selectMuscle)
                    state.isSelectArmMuscle.toggle()
                }
                return .none
                
            case .onSelectLegsMuscle:
                if !isMuscleLimitExceeded || state.isSelectLegsMuscle {
                    state.selectMuscle = addMuscle("하체", to: state.selectMuscle)
                    state.isSelectLegsMuscle.toggle()
                }
                return .none
                
            case .onSelectShoulderMuscle:
                if !isMuscleLimitExceeded || state.isSelectShoulderMuscle {
                    state.selectMuscle = addMuscle("어깨", to: state.selectMuscle)
                    state.isSelectShoulderMuscle.toggle()
                }
                return .none
                
            case .onSelectAbsMuscle:
                if !isMuscleLimitExceeded || state.isSelectAbsMuscle {
                    state.selectMuscle = addMuscle("복근", to: state.selectMuscle)
                    state.isSelectAbsMuscle.toggle()
                }
                return .none
                
            case .onTapNextButton:
                sideEffect.onTapNextButton(state.selectMuscle.joined(separator: ", "))
                return .none
            }
        }
    }

    private func addMuscle(_ muscle: String, to: [String]) -> [String] {
        var newArray = to
        let countOfMuscle = newArray.filter { $0 == muscle }.count
        
        if countOfMuscle >= 3 {
            if newArray.contains(muscle) {
                newArray.removeAll { $0 == muscle }
            }
        } else {
            if newArray.contains(muscle) {
                newArray.removeAll { $0 == muscle }
            } else {
                if countOfMuscle < 3 {
                    newArray.append(muscle)
                }
            }
        }
        
        return newArray
    }
}
