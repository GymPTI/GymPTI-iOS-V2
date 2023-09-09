//
//  SelectDaySideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import LinkNavigator

public protocol SelectDaySideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapNextButton: (String) -> Void { get }
}

public struct SelectDaySideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SelectDaySideEffectLive: SelectDaySideEffect {
    
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapNextButton: (String) -> Void {
        { day in
            navigator.next(paths: ["selecttargetmuscle"], items: ["selecttargetmuscle-day": day], isAnimated: true)
        }
    }
}
