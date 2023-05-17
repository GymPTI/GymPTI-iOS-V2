//
//  AppRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

struct AppRouterGroup {
    
    var routers: [RouteBuilder] {
        [
            LaunchRouteBuilder(),
            
            
            // 회원가입
            SignInRouteBuilder(),
            IdRouteBuilder(),
            PwRouteBuilder(),
            NameRouteBuilder(),
            EmailRouteBuilder(),
            VerificationRouteBuilder(),
            
            // 탭바
            TabBarRouteBuilder(),
            
            // 홈 화면
            HomeRouteBuilder(),
            TipRouteBuilder(),
            
            // 루틴 화면
            RoutineRouteBuilder(),
            
            // 친구 화면
            FriendRouteBuilder(),
            
            // 프로필 화면
            ProfileRouteBuilder(),
            EditInfoRouteBuilder(),
            EditAccountRouteBuilder(),
            FindIdRouteBuilder(),
            SettingRouteBuilder()
        ]
    }
}
