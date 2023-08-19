//
//  RoutineRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import LinkNavigator

struct RoutineRouteBuilder: RouteBuilder {
    
    var matchPath: String { "routine" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                RoutineView(store: .init(
                    initialState: Routine.State(),
                    reducer: {
                        Routine()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
