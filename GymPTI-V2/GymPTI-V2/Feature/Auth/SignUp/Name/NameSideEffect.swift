//
//  NameSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol NameSideEffect {
    
    var onTapNextButton: (String, String, String) -> Void { get }
    var onTapBackButton: () -> Void { get }
}

public struct NameSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension NameSideEffectLive: NameSideEffect {
    
    public var onTapNextButton: (String, String, String) -> Void {
        { id, pw, name in
            navigator.next(paths: ["email"], items: ["email-id": id, "email-pw": pw, "email-name": name], isAnimated: true)
        }
    }
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
