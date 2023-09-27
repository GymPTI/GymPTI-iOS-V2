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
            
            StartRouteBuilder(),
            
            //MARK: - SignIn / SignUp
            
            SignInRouteBuilder(),
            
            IdRouteBuilder(),
            
            PwRouteBuilder(),
            
            NameRouteBuilder(),
            
            EmailRouteBuilder(),
            
            VerificationRouteBuilder(),
            
            //MARK: - Main
            
            /// 탭바
            TabBarRouteBuilder(),
            
            /// 홈 화면
            HomeRouteBuilder(),
            
            /// 루틴 화면
            RoutineRouteBuilder(),
            
            SelectGoalRouteBuilder(),
            
            SetRoutineRouteBuilder(),
            
            SetRoutineDetailRouteBuilder(),
            
            /// 친구 화면
            FriendRouteBuilder(),
        
            /// 프로필 화면
            ProfileRouteBuilder(),
            
            SetPersonalProfileRouteBuilder(),
            
            EditInfoRouteBuilder(),
            
            /// 설정 화면
            SettingRouteBuilder(),
            
            EditAccountRouteBuilder(),

            FindIdRouteBuilder(),
            
            NotificationRouteBuilder()
        ]
    }
}
