//
//  FriendSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import LinkNavigator

public protocol FriendSideEffect {
    
    var tabButton: () -> Void { get }
}

public struct FriendSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension FriendSideEffectLive: FriendSideEffect {
    
    public var tabButton: () -> Void {
        {
            Token.remove(.accessToken)
            Token.remove(.refreshToken)
            navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
        }
    }
}
