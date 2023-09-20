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
    var onTapRoutineCard: ( String, @escaping () -> Void ) -> Void { get }
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
            navigator.next(paths: ["selectgoal"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapAddRoutineButton: () -> Void {
        {
            navigator.next(paths: ["selectday"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapRoutineCard: ( String, @escaping () -> Void ) -> Void {
        { exerciseName, action  in
            let alertModel = Alert(
                title: "삭제",
                message: "\"\(exerciseName)\"을(를) 삭제할까요?",
                buttons: [.init(title: "확인", style: .destructive) {
                    action()
                },
                          .init(title: "취소" ,style: .cancel) ],
                flagType: .default)
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
