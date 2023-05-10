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
    let home: HomeSideEffect
    let signIn: SignInSideEffect
    
    let id: IdSideEffect
    let pw: PwSideEffect
    let name: NameSideEffect
    let email: EmailSideEffect
    
    public static var liveValue: AppSideEffect {
        
        return .init(
            linkNavigator: navigator,
            home: HomeSideEffectLive(navigator: navigator),
            signIn: SignInSideEffectLive(navigator: navigator),
            
            id: IdSideEffectLive(navigator: navigator),
            pw: PwSideEffectLive(navigator: navigator),
            name: NameSideEffectLive(navigator: navigator),
            email: EmailSideEffectLive(navigator: navigator)
        )
    }
}

extension DependencyValues {
    
    var sideEffect: AppSideEffect {
        
        get { self[AppSideEffect.self] }
        set { self[AppSideEffect.self] = newValue }
    }
}
