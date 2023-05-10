//
//  SignInSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol SignInSideEffect {
    
    var onTapSignInButton: () -> Void { get }
    var onTapSignUpButton: () -> Void { get }
}

public struct SignInSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SignInSideEffectLive: SignInSideEffect {
    
    public var onTapSignInButton: () -> Void {
        {
            navigator.replace(paths: ["home"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapSignUpButton: () -> Void {
        {
            navigator.next(paths: ["id"], items: [:], isAnimated: true)
        }
    }
}
