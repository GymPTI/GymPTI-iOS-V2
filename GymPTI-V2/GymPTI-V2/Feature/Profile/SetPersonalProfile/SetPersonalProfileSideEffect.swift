//
//  SetPersonalProfileSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/27.
//

import LinkNavigator

public protocol SetPersonalProfileSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onSuccessPutBodyInfoData: () -> Void { get }
    var onFailPutBodyInfoData: () -> Void { get }
}

public struct SetPersonalProfileSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SetPersonalProfileSideEffectLive: SetPersonalProfileSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onSuccessPutBodyInfoData: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onFailPutBodyInfoData: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "신체 정보 변경에 실패했어요.",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
