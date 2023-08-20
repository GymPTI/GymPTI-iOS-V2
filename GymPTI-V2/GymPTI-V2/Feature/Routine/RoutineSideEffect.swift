//
//  RoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol RoutineSideEffect {
    
    var onTapAiAddRoutineButton: () -> Void { get }
    var onTapAddRoutineButton: () -> Void { get }
}

public struct RoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension RoutineSideEffectLive: RoutineSideEffect {
    
    public var onTapAiAddRoutineButton: () -> Void {
        {
            navigator.next(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapAddRoutineButton: () -> Void {
        {
            navigator.next(paths: ["addroutine"], items: [:], isAnimated: true)
        }
    }
}
