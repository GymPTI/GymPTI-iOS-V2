//
//  SignInSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol SignInSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onFailSignIn: (String) -> Void { get }
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
    
    public var onFailSignIn: (String) -> Void {
        { message in
            let alertModel = Alert(
                title: "실패",
                message: "\(message)",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
