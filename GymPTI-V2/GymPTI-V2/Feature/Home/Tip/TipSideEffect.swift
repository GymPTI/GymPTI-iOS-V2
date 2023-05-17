//
//  TipSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/16.
//

import LinkNavigator

public protocol TipSideEffect {
    
    var onTapBackButton: () -> Void { get }
}

public struct TipSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension TipSideEffectLive: TipSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
