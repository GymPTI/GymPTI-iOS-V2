//
//  SignInSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol SignInSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onFailSignIn: () -> Void { get }
    var onSuccessSignIn: () -> Void { get }
}

public struct SignInSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SignInSideEffectLive: SignInSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onFailSignIn: () -> Void {
        {
            let alertModel = Alert(
                title: "오류",
                message: "로그인에 실패했어요.",
                buttons: [.init(title: "확인", style: .default) {
                    navigator.rootReloadLast(items: [:], isAnimated: false)
                }],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onSuccessSignIn: () -> Void {
        {
            navigator.replace(paths: ["tabbar"], items: ["tabbar-selected": "home"], isAnimated: true)
        }
    }
}
