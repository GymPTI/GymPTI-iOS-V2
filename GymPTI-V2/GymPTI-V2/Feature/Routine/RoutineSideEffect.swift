//
//  RoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol RoutineSideEffect {
    
    var onTapSettingButton: () -> Void { get }
    var onTapNotificationButton: () -> Void { get }
}

public struct RoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension RoutineSideEffectLive: RoutineSideEffect {
    
    public var onTapSettingButton: () -> Void {
        {
            navigator.next(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapNotificationButton: () -> Void {
        {
            navigator.next(paths: ["notification"], items: [:], isAnimated: true)
        }
    }
}
