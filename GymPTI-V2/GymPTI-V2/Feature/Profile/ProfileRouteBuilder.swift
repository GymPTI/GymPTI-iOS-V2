//
//  ProfileRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import LinkNavigator

struct ProfileRouteBuilder: RouteBuilder {
    
    var matchPath: String { "profile" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                ProfileView(store: .init(
                    initialState: Profile.State(),
                    reducer: Profile()))
            }
        }
    }
}
