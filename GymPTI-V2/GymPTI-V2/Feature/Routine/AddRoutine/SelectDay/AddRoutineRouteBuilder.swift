//
//  SelectDayRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import SwiftUI
import LinkNavigator

struct SelectDayRouteBuilder: RouteBuilder {
    
    var matchPath: String { "selectday" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                SelectDayView(store: .init(
                    initialState: SelectDay.State(),
                    reducer: {
                        SelectDay()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
