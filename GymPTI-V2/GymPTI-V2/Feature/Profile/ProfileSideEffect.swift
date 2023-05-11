//
//  ProfileSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol ProfileSideEffect {
    
    var onTapEditInfoButton: () -> Void { get }
    var onTapEditAccountButton: () -> Void { get }
}

public struct ProfileSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension ProfileSideEffectLive: ProfileSideEffect {
    
    public var onTapEditInfoButton: () -> Void {
        {
            navigator.next(paths: ["editinfo"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapEditAccountButton: () -> Void {
        {
            navigator.next(paths: ["editaccount"], items: [:], isAnimated: true)
        }
    }
}
