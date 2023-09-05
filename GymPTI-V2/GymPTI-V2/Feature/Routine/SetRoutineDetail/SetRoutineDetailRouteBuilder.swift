//
//  SetRoutineDetailRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/05.
//

import SwiftUI
import LinkNavigator

struct SetRoutineDetailRouteBuilder: RouteBuilder {
    
    var matchPath: String { "setroutinedetail" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                SetRoutineDetailView(store: .init(
                    initialState: SetRoutineDetail.State(),
                    reducer: {
                        SetRoutineDetail()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
