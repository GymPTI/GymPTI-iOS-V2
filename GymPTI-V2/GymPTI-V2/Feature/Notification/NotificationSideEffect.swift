//
//  NotificationSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/31.
//

import LinkNavigator
import SwiftUI

public protocol NotificationSideEffect {
    
    var onTapBackButton: () -> Void { get }
}

public struct NotificationSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension NotificationSideEffectLive: NotificationSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
}
