//
//  TabBarRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import LinkNavigator

struct TabBarRouteBuilder: RouteBuilder {
    
    var matchPath: String { "tabbar" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                TabBarView(selected: "")
            }
        }
    }
}
