//
//  SetRoutineSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/21.
//

import LinkNavigator

public protocol SetRoutineSideEffect {
    
    var onTapBackButton: () -> Void { get }
    var onTapNextButton: ( String, String ) -> Void { get }
}

public struct SetRoutineSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension SetRoutineSideEffectLive: SetRoutineSideEffect {
    
    public var onTapBackButton: () -> Void {
        {
            navigator.back(isAnimated: true)
        }
    }
    
    public var onTapNextButton: ( String, String ) -> Void {
        { day, excersizeName in
            navigator.next(paths: ["setroutinedetail"], items: ["setroutinedetail-day": day, "setroutinedetail-exerciseName": excersizeName], isAnimated: true)
            print(day, excersizeName)
        }
    }
}
