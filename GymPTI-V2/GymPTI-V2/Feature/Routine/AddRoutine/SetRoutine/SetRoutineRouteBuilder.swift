//
//  SetRoutineRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/21.
//

import SwiftUI
import LinkNavigator

struct SetRoutineRouteBuilder: RouteBuilder {
    
    var matchPath: String { "setroutine" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                SetRoutineView(store: .init(
                    initialState: SetRoutine.State(
                    day: items.getValue(key: "setroutine-day") ?? "",
                    exerciseName: items.getValue(key: "setroutine-exerciseName") ?? ""),
                    reducer: {
                        SetRoutine()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}

