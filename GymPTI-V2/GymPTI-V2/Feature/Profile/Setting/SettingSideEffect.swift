//
//  EditSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol SettingSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapLogoutButton: () -> Void { get }
}

public struct SettingSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SettingSideEffectLive: SettingSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapLogoutButton: () -> Void {
        {
            Token.remove(.accessToken)
            Token.remove(.refreshToken)
            navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
        }
    }
}
