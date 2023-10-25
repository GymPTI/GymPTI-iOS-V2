//
//  AddAiRoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import LinkNavigator

public protocol AddAiRoutineSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapNextButton: ([String]) -> Void { get }
}

public struct AddAiRoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension AddAiRoutineSideEffectLive: AddAiRoutineSideEffect {
    
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapNextButton: ([String]) -> Void {
        { selectMuscle in
            let alertModel = Alert(
                title: "생성",
                message: "\(selectMuscle) 운동 루틴을 생성하시겠습니까?",
                buttons: [ActionButton(title: "확인", style: .default, action: {
                    navigator.next(paths: ["decideairoutine"], items: [:], isAnimated: true)
                }), ActionButton(title: "취소", style: .cancel)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
