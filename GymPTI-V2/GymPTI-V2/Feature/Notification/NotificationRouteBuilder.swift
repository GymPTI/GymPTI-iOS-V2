//
//  NotificationRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/31.
//

import SwiftUI
import LinkNavigator

struct NotificationRouteBuilder: RouteBuilder {
    
    var matchPath: String { "notification" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                NotificationView(store: .init(
                    initialState: Notification.State(),
                    reducer: {
                        Notification()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
