//
//  EmailSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol EmailSideEffect {
    
    var failSendEmail: () -> Void { get }
    var sucessSendEmail: (String) -> Void { get }
    
    var fail: () -> Void { get }
    var fail2: () -> Void { get }
    
    var sucessSignUp: () -> Void { get }
}

public struct EmailSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension EmailSideEffectLive: EmailSideEffect {
    
    public var failSendEmail: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "이메일 전송에 실패하였습니다.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var sucessSendEmail: (String) -> Void {
        { email in
            let alertModel = Alert(
                title: "성공",
                message: "\(email)\n(으)로 이메일을 전송했습니다.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var fail: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "인증번호가 올바르지 않습니다.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var fail2: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "회원가입을 다시 진행해주세요.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            self.navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var sucessSignUp: () -> Void {
        {
            navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
        }
    }
    
}
