//
//  ProfileSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import LinkNavigator

public protocol ProfileSideEffect {
    
    var onTapSettingButton: () -> Void { get }
    var onTapNotificationButton: () -> Void { get }
    var onTapEditInfoButton: (String, String, String) -> Void { get }
    var onTapSetPersonalProfileButton: (String, String, String, String) -> Void { get }
}

public struct ProfileSideEffectLive {
    
    let navigator: LinkNavigatorType
    
    public init(navigator: LinkNavigatorType) {
        self.navigator = navigator
    }
}

extension ProfileSideEffectLive: ProfileSideEffect {
    
    public var onTapSettingButton: () -> Void {
        {
            navigator.next(paths: ["setting"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapNotificationButton: () -> Void {
        {
            navigator.next(paths: ["notification"], items: [:], isAnimated: true)
        }
    }
    
    public var onTapEditInfoButton: (String, String, String) -> Void {
        { name, statusMessage, profileImage in
            navigator.next(paths: ["editinfo"], items: [
                "editinfo-newName": name,
                "editinfo-newStatusMessage": statusMessage,
                "editinfo-profileImage": profileImage
            ], isAnimated: true)
        }
    }
    
    public var onTapSetPersonalProfileButton: (String, String, String, String) -> Void {
        { gender, age, height, weight in
            navigator.next(paths: ["setpersonalprofile"], items: [
                "setpersonalprofile-gender": gender,
                "setpersonalprofile-age": age,
                "setpersonalprofile-height": height,
                "setpersonalprofile-weight": weight
            ], isAnimated: true)
        }
    }
}
