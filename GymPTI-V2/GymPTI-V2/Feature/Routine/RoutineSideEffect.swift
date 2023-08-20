//
//  RoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol RoutineSideEffect {
    
    var onTapAiAddRoutineButton: () -> Void { get }
    var onTapAddRoutineButton: () -> Void { get }
}

public struct RoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension RoutineSideEffectLive: RoutineSideEffect {
    
    public var onTapAiAddRoutineButton: () -> Void {
        {
            let alertModel = Alert(
                title: "앗!",
                message: "AI 루틴 추가는 아직 구현되지 않았어요.",
                buttons: [.init(title: "확인", style: .default) ],
                flagType: .error)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onTapAddRoutineButton: () -> Void {
        {
            navigator.next(paths: ["addroutine"], items: [:], isAnimated: true)
        }
    }
}
