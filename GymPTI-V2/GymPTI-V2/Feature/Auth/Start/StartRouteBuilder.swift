//
//  StartRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/18.
//

import SwiftUI
import LinkNavigator

struct StartRouteBuilder: RouteBuilder {
    
    var matchPath: String { "start" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                StartView(store: .init(
                    initialState: Start.State(),
                    reducer: {
                        Start()
                    }))
            }
        }
    }
}
