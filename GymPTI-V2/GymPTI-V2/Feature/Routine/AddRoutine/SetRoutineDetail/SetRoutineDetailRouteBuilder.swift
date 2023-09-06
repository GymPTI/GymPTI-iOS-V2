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
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                SetRoutineDetailView(store: .init(
                    initialState: SetRoutineDetail.State(
                        day: items.getValue(key: "setroutinedetail-day") ?? "",
                        exerciseName: items.getValue(key: "setroutinedetail-exerciseName") ?? ""
                    ),
                    reducer: {
                        SetRoutineDetail()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}

extension [String: String] {
    fileprivate func getValue(key: String) -> String? {
        first(where: { $0.key == key })?.value as? String
    }
}
