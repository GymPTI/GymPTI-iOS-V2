//
//  VerificationSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import LinkNavigator

public protocol VerificationSideEffect {
    
    var onTapBackButton: () -> Void { get }
    
    var failVerification: () -> Void { get }
    var failSignUp: () -> Void { get }
    
    var sucessSignUp: () -> Void { get }
}

public struct VerificationSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension VerificationSideEffectLive: VerificationSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var failVerification: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "인증번호가 올바르지 않습니다.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var failSignUp: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "회원가입을 다시 진행해주세요.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var sucessSignUp: () -> Void {
        {
            let alertModel = Alert(
                title: "회원가입 성공",
                message: "바로 로그인을 해보세요!",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            
            navigator.alert(target: .default, model: alertModel)
            navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
        }
    }
    
}
