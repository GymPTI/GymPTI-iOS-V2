//
//  FriendSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import LinkNavigator

public protocol FriendSideEffect {
    
    var onTapSettingButton: () -> Void { get }
    var onTapNotificationButton: () -> Void { get }
}

public struct FriendSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension FriendSideEffectLive: FriendSideEffect {
    
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
