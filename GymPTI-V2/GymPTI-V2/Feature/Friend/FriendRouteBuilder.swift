//
//  FriendRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import LinkNavigator

struct FriendRouteBuilder: RouteBuilder {
    
    var matchPath: String { "friend" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                FriendView(store: .init(
                    initialState: Friend.State(),
                    reducer: Friend()))
                .navigationBarHidden(true)
            }
        }
    }
}
