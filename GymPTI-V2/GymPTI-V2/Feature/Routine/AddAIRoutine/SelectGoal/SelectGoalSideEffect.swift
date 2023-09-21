//
//  SelectGoalSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/14.
//

import LinkNavigator

public protocol SelectGoalSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapNextButton: (String) -> Void { get }
}

public struct SelectGoalSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SelectGoalSideEffectLive: SelectGoalSideEffect {
    
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapNextButton: (String) -> Void {
        { goal in
            navigator.next(paths: [""], items: [:], isAnimated: true)
        }
    }
}
