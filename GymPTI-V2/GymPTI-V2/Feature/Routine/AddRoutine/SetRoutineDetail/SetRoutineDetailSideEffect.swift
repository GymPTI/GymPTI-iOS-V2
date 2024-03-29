//
//  SetRoutineDetailSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/05.
//

import LinkNavigator

public protocol SetRoutineDetailSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapAddButton: ( @escaping () -> Void ) -> Void { get }
    var onSucessPostRoutineCreate: () -> Void { get }
    var onFailPostRoutineCreate: () -> Void { get }
}

public struct SetRoutineDetailSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SetRoutineDetailSideEffectLive: SetRoutineDetailSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapAddButton: ( @escaping () -> Void ) -> Void {
        { action in
            let alertModel = Alert(
                title: "추가",
                message: "해당 루틴을 추가하시겠습니까?",
                buttons: [ActionButton(title: "확인", style: .default) {
                    action()
                }, ActionButton(title: "취소", style: .cancel)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onSucessPostRoutineCreate: () -> Void {
        {
            navigator.replace(paths: ["tabbar"], items: ["tabbar-selected": "routine"], isAnimated: true)
        }
    }
    
    public var onFailPostRoutineCreate: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "루틴 추가에 실패했어요.",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
