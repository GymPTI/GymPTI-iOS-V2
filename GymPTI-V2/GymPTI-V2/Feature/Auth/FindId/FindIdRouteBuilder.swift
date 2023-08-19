//
//  FindIdRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import LinkNavigator

struct FindIdRouteBuilder: RouteBuilder {
    
    var matchPath: String { "findid" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                FindIdView(store: .init(
                    initialState: FindId.State(),
                    reducer: {
                        FindId()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
