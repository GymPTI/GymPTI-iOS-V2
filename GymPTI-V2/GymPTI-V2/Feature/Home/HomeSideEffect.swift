//
//  HomeSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol HomeSideEffect {
    
    var tabButton: () -> Void { get }
}

public struct HomeSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension HomeSideEffectLive: HomeSideEffect {
    
    public var tabButton: () -> Void {
        {
            Token.remove(.accessToken)
            Token.remove(.refreshToken)
            navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
        }
    }
}
