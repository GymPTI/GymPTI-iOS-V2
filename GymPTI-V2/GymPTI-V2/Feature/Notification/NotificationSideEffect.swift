//
//  NotificationSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/31.
//

import LinkNavigator
import SwiftUI

public protocol NotificationSideEffect {
    
    var onTapEditAccountButton: () -> Void { get }
    var onTapBackButton: () -> Void { get }
    var onTapLogoutButton: () -> Void { get }
    var onTapFindIdButton: () -> Void { get }
}

public struct NotificationSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension NotificationSideEffectLive: NotificationSideEffect {
    
    public var onTapEditAccountButton: () -> Void {
        {
            navigator.next(paths: ["editpassword"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapLogoutButton: () -> Void {
        {
            let alertModel = Alert(
                title: "로그아웃",
                message: "정말 로그아웃 하시겠습니까?.",
                buttons: [ActionButton(title: "확인", style: .default, action: {
                    
                    Token.remove(.accessToken)
                    Token.remove(.refreshToken)
                    navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
                }), ActionButton(title: "취소", style: .cancel)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onTapFindIdButton: () -> Void {
        {
            navigator.next(paths: ["findid"], items: [:], isAnimated: true)
        }
    }
}
