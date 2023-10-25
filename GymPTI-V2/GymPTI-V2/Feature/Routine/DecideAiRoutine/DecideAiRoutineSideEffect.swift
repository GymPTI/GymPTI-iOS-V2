//
//  DecideAiRoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/25/23.
//

import LinkNavigator

public protocol DecideAiRoutineSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapDecideButton: () -> Void { get }
    var onFailGetAiRoutineList: () -> Void { get}
}

public struct DecideAiRoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension DecideAiRoutineSideEffectLive: DecideAiRoutineSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapDecideButton: () -> Void {
        {
            navigator.replace(paths: ["tabbar"], items: ["tabbar-selected": "routine"], isAnimated: true)
        }
    }
    
    public var onFailGetAiRoutineList: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "ai 루틴 생성에 실패했어요.",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
