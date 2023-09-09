//
//  TabBarSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/09.
//

import LinkNavigator

public protocol TabBarSideEffect {
    
    var isWifiUnconnected: () -> Void { get }
}

public struct TabBarSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension TabBarSideEffectLive: TabBarSideEffect {
    
    public var isWifiUnconnected: () -> Void {
        {
            let alertModel = Alert(
                title: "오류",
                message: "인터넷이 연결되지 않았습니다,\n인터넷 연결을 확인하고 재접속 해주세요.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
