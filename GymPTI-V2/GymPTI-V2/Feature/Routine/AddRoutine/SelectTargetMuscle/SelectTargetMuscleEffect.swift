//
//  SelectTargetMuscleEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/04.
//

import LinkNavigator

public protocol SelectTargetMuscleSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapNextButton: (String, String) -> Void { get }
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
    
    public var onTapNextButton: (String, String) -> Void {
        { day, excersizeName in
            navigator.next(paths: ["setroutinedetail"], items: ["setroutinedetail-day": day, "setroutinedetail-exerciseName": "운동이름"], isAnimated: true)
        }
    }
}
