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
    var onTapRecreateButton: () -> Void { get }
    var onSuccessGetAiRoutineList: () -> Void { get }
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
    
    public var onSuccessGetAiRoutineList: () -> Void {
        {
            let alertModel = Alert(
                title: "성공",
                message: "성공적으로 루틴을 만들었어요!",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onFailGetAiRoutineList: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "ai 루틴 생성에 실패했어요...",
                buttons: [.init(title: "확인", style: .default) {
                    navigator.back(isAnimated: true)
                }],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onTapRecreateButton: () -> Void {
        {
            let alertModel = Alert(
                title: "재생성",
                message: "마음에 안드시나요?\n다시 만들어볼게요!",
                buttons: [.init(title: "확인", style: .default) {
                    
                }, .init(title: "취소", style: .cancel)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
