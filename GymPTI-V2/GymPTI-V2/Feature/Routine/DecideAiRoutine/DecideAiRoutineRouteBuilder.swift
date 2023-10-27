//
//  DecideAiRoutineRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/25/23.
//

import LinkNavigator

struct DecideAiRoutineRouteBuilder: RouteBuilder {
    
    var matchPath: String { "decideairoutine" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                DecideAiRoutineView(store: .init(
                    initialState: DecideAiRoutine.State(
                        selectMuscle: items.getValue(key: "decideairoutine-selectMuscle") ?? ""
                    ),
                    reducer: {
                        DecideAiRoutine()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
