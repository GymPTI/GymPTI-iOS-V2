//
//  HomeSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol HomeSideEffect {
    
    var onTapTipButton: () -> Void { get }
}

public struct HomeSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension HomeSideEffectLive: HomeSideEffect {
    
    public var onTapTipButton: () -> Void {
        {
            navigator.fullSheet(paths: ["tip"], items: [:], isAnimated: true, prefersLargeTitles: false)
        }
    }
}
