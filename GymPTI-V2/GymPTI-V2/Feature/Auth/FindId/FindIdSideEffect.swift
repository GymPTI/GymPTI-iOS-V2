//
//  FindIdSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import LinkNavigator

public protocol FindIdSideEffect {
    
    var onTapBackButton: () -> Void { get }
}

public struct FindIdSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension FindIdSideEffectLive: FindIdSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
