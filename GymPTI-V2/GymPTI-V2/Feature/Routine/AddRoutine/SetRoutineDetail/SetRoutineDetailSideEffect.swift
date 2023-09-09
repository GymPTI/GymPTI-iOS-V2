//
//  SetRoutineDetailSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/05.
//

import LinkNavigator

public protocol SetRoutineDetailSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapAddButton: () -> Void { get }
}

public struct SetRoutineDetailSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SetRoutineDetailSideEffectLive: SetRoutineDetailSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapAddButton: () -> Void {
        {
            navigator.replace(paths: ["tabbar"], items: ["tabbar-selected": "routine"], isAnimated: true)
        }
    }
}
