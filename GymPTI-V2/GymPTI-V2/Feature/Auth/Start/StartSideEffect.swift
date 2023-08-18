//
//  StartSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/18.
//

import LinkNavigator

public protocol StartSideEffect {
    
    var onTapSignInButton: () -> Void { get }
    var onTapSignUpButton: () -> Void { get }
}

public struct StartSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension StartSideEffectLive: StartSideEffect {
    
    public var onTapSignInButton: () -> Void {
        {
            navigator.next(paths: ["signin"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapSignUpButton: () -> Void {
        {
            navigator.next(paths: ["id"], items: [:], isAnimated: true)
        }
    }
}
