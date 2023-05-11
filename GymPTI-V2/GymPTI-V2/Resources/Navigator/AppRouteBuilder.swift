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
            
            SignInRouteBuilder(),
            IdRouteBuilder(),
            PwRouteBuilder(),
            NameRouteBuilder(),
            EmailRouteBuilder(),
            
            TabBarRouteBuilder(),
            
            
            HomeRouteBuilder(),
            
            
            RoutineRouteBuilder(),
            
            
            ProfileRouteBuilder(),
            EditInfoRouteBuilder(),
            EditAccountRouteBuilder(),
            SettingRouteBuilder()
        ]
    }
}
