//
//  AddRoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import LinkNavigator

public protocol AddRoutineSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapAddButton: () -> Void { get }
}

public struct AddRoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension AddRoutineSideEffectLive: AddRoutineSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapAddButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
