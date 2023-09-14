//
//  PwRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import LinkNavigator

struct PwRouteBuilder: RouteBuilder {
    
    var matchPath: String { "pw" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                PwView(store: .init(
                    initialState: Pw.State(
                        id: items.getValue(key: "pw-id") ?? "",
                        pw: items.getValue(key: "pw-pw") ?? ""),
                    reducer: {
                        Pw()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
