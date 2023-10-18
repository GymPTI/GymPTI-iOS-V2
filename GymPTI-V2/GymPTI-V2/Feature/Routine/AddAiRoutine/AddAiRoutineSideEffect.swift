//
//  AddAiRoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import LinkNavigator

public protocol AddAiRoutineSideEffect {
    
    var onTapBackButton: () -> Void { get }
}

public struct AddAiRoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension AddAiRoutineSideEffectLive: AddAiRoutineSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
