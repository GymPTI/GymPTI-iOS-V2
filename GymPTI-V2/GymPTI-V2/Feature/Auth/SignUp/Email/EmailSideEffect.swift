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
}
