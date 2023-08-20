//
//  AddRoutineRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import SwiftUI
import LinkNavigator

struct AddRoutineRouteBuilder: RouteBuilder {
    
    var matchPath: String { "addroutine" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                AddRoutineView(store: .init(
                    initialState: AddRoutine.State(),
                    reducer: {
                        AddRoutine()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
