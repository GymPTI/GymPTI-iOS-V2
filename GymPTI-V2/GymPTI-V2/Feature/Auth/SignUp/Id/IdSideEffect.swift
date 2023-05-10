//
//  IdSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol IdSideEffect {
    
    var onTapNextButton: (String) -> Void { get }
}

public struct IdSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension IdSideEffectLive: IdSideEffect {
    
    public var onTapNextButton: (String) -> Void {
        { id in
            navigator.next(paths: ["pw"], items: ["pw-id": id], isAnimated: true)
        }
    }
}
