//
//  ProfileSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol ProfileSideEffect {
    
    var tabButton: () -> Void { get }
}

public struct ProfileSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension ProfileSideEffectLive: ProfileSideEffect {
    
    public var tabButton: () -> Void {
        {
            Token.remove(.accessToken)
            Token.remove(.refreshToken)
            navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
        }
    }
}
