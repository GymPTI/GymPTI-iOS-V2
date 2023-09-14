//
//  SelectTargetMuscleRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/04.
//

import SwiftUI
import LinkNavigator

struct SelectTargetMuscleRouteBuilder: RouteBuilder {
    
    var matchPath: String { "selecttargetmuscle" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                SelectTargetMuscleView(store: .init(
                    initialState: SelectTargetMuscle.State(
                    day: items.getValue(key: "selecttargetmuscle-day") ?? "",
                    exerciseName: items.getValue(key: "selecttargetmuscle-exerciseName") ?? ""),
                    reducer: {
                        SelectTargetMuscle()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
