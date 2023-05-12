//
//  AppSideEffect.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import Dependencies
import Foundation
import LinkNavigator

public struct EmptyDependency: DependencyType {
    
}

fileprivate var navigator: LinkNavigatorType = LinkNavigator(
    dependency: EmptyDependency(),
    builders: AppRouterGroup().routers)

public struct AppSideEffect: DependencyKey {
    
    let linkNavigator: LinkNavigatorType
    
    let signIn: SignInSideEffect
    
    let id: IdSideEffect
    let pw: PwSideEffect
    let name: NameSideEffect
    let email: EmailSideEffect
    let verification: VerificationSideEffect
    
    let home: HomeSideEffect
    
    let routine: RoutineSideEffect
    
    let friend: FriendSideEffect
    
    let profile: ProfileSideEffect
    let editInfo: EditInfoSideEffect
    let editAccount: EditAccountSideEffect
    let findId: FindIdSideEffect
    let setting: SettingSideEffect
    
    public static var liveValue: AppSideEffect {
        
        return .init(
            linkNavigator: navigator,
            signIn: SignInSideEffectLive(navigator: navigator),
            
            id: IdSideEffectLive(navigator: navigator),
            pw: PwSideEffectLive(navigator: navigator),
            name: NameSideEffectLive(navigator: navigator),
            email: EmailSideEffectLive(navigator: navigator),
            verification: VerificationSideEffectLive(navigator: navigator),
            
            home: HomeSideEffectLive(navigator: navigator),
            
            routine: RoutineSideEffectLive(navigator: navigator),
            
            friend: FriendSideEffectLive(navigator: navigator),
            
            profile: ProfileSideEffectLive(navigator: navigator),
            editInfo: EditInfoSideEffectLive(navigator: navigator),
            editAccount: EditAccountSideEffectLive(navigator: navigator),
            findId: FindIdSideEffectLive(navigator: navigator),
            setting: SettingSideEffectLive(navigator: navigator)
        )
    }
}

extension DependencyValues {
    
    var sideEffect: AppSideEffect {
        
        get { self[AppSideEffect.self] }
        set { self[AppSideEffect.self] = newValue }
    }
}
