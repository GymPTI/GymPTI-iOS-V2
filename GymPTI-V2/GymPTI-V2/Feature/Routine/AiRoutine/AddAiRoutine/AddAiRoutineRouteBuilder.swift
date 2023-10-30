//
//  AddAiRoutineRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import LinkNavigator

struct AddAiRoutineRouteBuilder: RouteBuilder {
    
    var matchPath: String { "addairoutine" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                AddAiRoutineView(store: .init(
                    initialState: AddAiRoutine.State(),
                    reducer: {
                        AddAiRoutine()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
