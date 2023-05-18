//
//  SettingRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import LinkNavigator

struct SettingRouteBuilder: RouteBuilder {
    
    var matchPath: String { "setting" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                SettingView(store: .init(
                    initialState: Setting.State(),
                    reducer: Setting()))
                .navigationBarHidden(true)
            }
        }
    }
}
