//
//  EmailSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

public protocol EmailSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onFailSendEmail: () -> Void { get }
    var onSucessSendEmail: (String, String, String, String) -> Void { get }
}

public struct EmailSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension EmailSideEffectLive: EmailSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onSucessSendEmail: (String, String, String, String) -> Void {
        { id, pw, name, email in
            let alertModel = Alert(
                title: "성공",
                message: "\(email)\n(으)로 이메일을 전송했습니다.",
                buttons: [.init(title: "확인", style: .default) {
                    navigator.next(paths: ["verification"], items: ["verification-id": id, "verification-pw": pw, "verification-name": name, "verification-email": email], isAnimated: true)
                }],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onFailSendEmail: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "이메일 전송에 실패하였습니다.",
                buttons: [.init(title: "확인", style: .default) {
                    navigator.rootReloadLast(items: [:], isAnimated: false)
                } ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
