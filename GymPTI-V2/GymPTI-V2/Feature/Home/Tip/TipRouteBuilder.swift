//
//  TipRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/16.
//

import SwiftUI
import LinkNavigator

struct TipRouteBuilder: RouteBuilder {
    
    var matchPath: String { "tip" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                TipView(store: .init(
                        initialState: Tip.State(),
                        reducer: Tip()))
                .navigationBarHidden(true)
            }
        }
    }
}
