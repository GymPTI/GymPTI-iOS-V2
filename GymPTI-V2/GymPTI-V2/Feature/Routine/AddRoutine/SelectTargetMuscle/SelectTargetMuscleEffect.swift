//
//  SelectTargetMuscleEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/04.
//

import LinkNavigator

public protocol SelectTargetMuscleSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapNextButton: () -> Void { get }
}

public struct SelectTargetMuscleSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SelectTargetMuscleSideEffectLive: SelectTargetMuscleSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapNextButton: () -> Void {
        {
            navigator.next(paths: ["setroutinedetail"], items: [:], isAnimated: true)
        }
    }
}
