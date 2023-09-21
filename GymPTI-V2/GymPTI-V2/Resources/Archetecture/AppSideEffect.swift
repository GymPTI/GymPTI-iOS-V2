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

var navigator: LinkNavigatorType = LinkNavigator(
    dependency: EmptyDependency(),
    builders: AppRouterGroup().routers)

public struct AppSideEffect: DependencyKey {
    
    let linkNavigator: LinkNavigatorType
    
    let start: StartSideEffect
    
    let signIn: SignInSideEffect
    
    let id: IdSideEffect
    
    let pw: PwSideEffect
    
    let name: NameSideEffect
    
    let email: EmailSideEffect
    
    let verification: VerificationSideEffect
    
    let tabbar: TabBarSideEffect
    
    let home: HomeSideEffect
    
    let routine: RoutineSideEffect
    
    let selectGoal: SelectGoalSideEffect
    
    let setRoutine: SetRoutineSideEffect
    
    let setRoutineDetail: SetRoutineDetailSideEffect
    
    let friend: FriendSideEffect
    
    let profile: ProfileSideEffect
    
    let editInfo: EditInfoSideEffect
    
    let editAccount: EditAccountSideEffect
    
    let setting: SettingSideEffect
    
    let findId: FindIdSideEffect
    
    let notification: NotificationSideEffect
    
    public static var liveValue: AppSideEffect {
        
        return .init(
            linkNavigator: navigator,
            
            start: StartSideEffectLive(navigator: navigator),
            
            signIn: SignInSideEffectLive(navigator: navigator),
            
            id: IdSideEffectLive(navigator: navigator),
            
            pw: PwSideEffectLive(navigator: navigator),
            
            name: NameSideEffectLive(navigator: navigator),
            
            email: EmailSideEffectLive(navigator: navigator),
            
            verification: VerificationSideEffectLive(navigator: navigator),
            
            tabbar: TabBarSideEffectLive(navigator: navigator),
            
            home: HomeSideEffectLive(navigator: navigator),
            
            routine: RoutineSideEffectLive(navigator: navigator),
            
            selectGoal: SelectGoalSideEffectLive(navigator: navigator),
            
            setRoutine: SetRoutineSideEffectLive(navigator: navigator),
            
            setRoutineDetail: SetRoutineDetailSideEffectLive(navigator: navigator),
            
            friend: FriendSideEffectLive(navigator: navigator),
            
            profile: ProfileSideEffectLive(navigator: navigator),
            
            editInfo: EditInfoSideEffectLive(navigator: navigator),
            
            editAccount: EditAccountSideEffectLive(navigator: navigator),
            
            setting: SettingSideEffectLive(navigator: navigator),
            
            findId: FindIdSideEffectLive(navigator: navigator),
            
            notification: NotificationSideEffectLive(navigator: navigator)
        )
    }
}

extension DependencyValues {
    
    var sideEffect: AppSideEffect {
        
        get { self[AppSideEffect.self] }
        set { self[AppSideEffect.self] = newValue }
    }
}
