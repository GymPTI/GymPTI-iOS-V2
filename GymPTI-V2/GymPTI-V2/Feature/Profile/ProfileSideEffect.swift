//
//  ProfileSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol ProfileSideEffect {
    
    var onTapEditInfoButton: (String) -> Void { get }
    var onTapEditAccountButton: () -> Void { get }
    var onTapSettingButton: () -> Void { get }
}

public struct ProfileSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension ProfileSideEffectLive: ProfileSideEffect {
    
    public var onTapEditInfoButton: (String) -> Void {
        { profileImage in
            navigator.next(paths: ["editinfo"], items: ["editinfo-profileimage": profileImage], isAnimated: true)
        }
    }
    
    public var onTapEditAccountButton: () -> Void {
        {
            navigator.next(paths: ["editaccount"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapSettingButton: () -> Void {
        {
            navigator.next(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
}
