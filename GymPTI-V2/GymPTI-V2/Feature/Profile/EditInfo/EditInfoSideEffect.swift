//
//  EditInfoSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol EditInfoSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onSuccessPutUserData: () -> Void { get }
    var onFailPutUserData: () -> Void { get }
}

public struct EditInfoSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension EditInfoSideEffectLive: EditInfoSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onSuccessPutUserData: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onFailPutUserData: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "프로필 정보 변경에 실패했어요.",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
