//
//  SelectGoalRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/14.
//

import SwiftUI
import LinkNavigator

struct SelectGoalRouteBuilder: RouteBuilder {
    
    var matchPath: String { "selectgoal" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                SelectGoalView(store: .init(
                    initialState: SelectGoal.State(),
                    reducer: {
                        SelectGoal()
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


