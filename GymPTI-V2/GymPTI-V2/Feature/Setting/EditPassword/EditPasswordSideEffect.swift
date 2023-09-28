//
//  EditPasswordSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol EditPasswordSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onSuccessPutUserPassword: () -> Void { get }
    var onFailPutUserPassword: () -> Void { get }
}


public struct EditPasswordSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension EditPasswordSideEffectLive: EditPasswordSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onSuccessPutUserPassword: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onFailPutUserPassword: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "비밀번호 변경에 실패했어요.",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
