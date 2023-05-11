//
//  PwSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol PwSideEffect {
    
    var onTapNextButton: (String, String) -> Void { get }
    var onTapBackButton: () -> Void { get }
}

public struct PwSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension PwSideEffectLive: PwSideEffect {
    
    public var onTapNextButton: (String, String) -> Void {
        { id, pw in
            navigator.next(paths: ["name"], items: ["name-id": id, "name-pw": pw], isAnimated: true)
        }
    }
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
