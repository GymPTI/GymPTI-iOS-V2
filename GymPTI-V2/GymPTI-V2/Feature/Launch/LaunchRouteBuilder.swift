//
//  LaunchRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import LinkNavigator

struct LaunchRouteBuilder: RouteBuilder {
    
    var matchPath: String { "launch" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                LaunchView(navigator: navigator)
                    .navigationBarHidden(true)
            }
        }
    }
}
