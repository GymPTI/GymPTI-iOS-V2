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
    var onTapDeleteButton: ( String, @escaping () -> Void ) -> Void { get }
    var onTapRoutineCard: ( String, @escaping () -> Void ) -> Void { get }
    var onTapCompletedButton: ( @escaping () -> Void ) -> Void { get }
    var onFailDeleteRoutineCard: () -> Void { get }
    var onFailPutCompleteRoutine: () -> Void { get }
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
            navigator.next(paths: ["addairoutine"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapAddRoutineButton: () -> Void {
        {
            navigator.next(paths: ["setroutine"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapDeleteButton: ( String, @escaping () -> Void ) -> Void {
        { day, action  in
            let alertModel = Alert(
                title: "삭제",
                message: "\(day)요일의 루틴을 전체 삭제할까요?",
                buttons: [.init(title: "확인", style: .default) {
                    action()
                }, .init(title: "취소" ,style: .cancel) ],
                flagType: .default)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onTapRoutineCard: ( String, @escaping () -> Void ) -> Void {
        { exerciseName, action  in
            let alertModel = Alert(
                title: "삭제",
                message: "\"\(exerciseName)\"을(를) 삭제할까요?",
                buttons: [.init(title: "확인", style: .default) {
                    action()
                }, .init(title: "취소" ,style: .cancel) ],
                flagType: .default)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onTapCompletedButton: ( @escaping () -> Void ) -> Void {
        { action in
            let alertModel = Alert(
                title: "완료",
                message: "루틴을 완수하셨나요? \n(\"네\"를 누르시면 변경하실 수 없습니다.)",
                buttons: [.init(title: "네", style: .default) {
                    action()
                }, .init(title: "아니요" ,style: .cancel) ],
                flagType: .default)
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onFailDeleteRoutineCard: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "루틴 삭제를 실패했어요.",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
    
    public var onFailPutCompleteRoutine: () -> Void {
        {
            let alertModel = Alert(
                title: "실패",
                message: "루틴 완료를 실패했어요.",
                buttons: [.init(title: "확인", style: .default)],
                flagType: .error
            )
            navigator.alert(target: .default, model: alertModel)
        }
    }
}
