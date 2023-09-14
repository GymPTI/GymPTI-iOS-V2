//
//  SignInRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import LinkNavigator

struct SignInRouteBuilder: RouteBuilder {
    
    var matchPath: String { "signin" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                SignInView(store: .init(
                    initialState: SignIn.State(
                        id: items.getValue(key: "id") ?? "",
                        pw: items.getValue(key: "pw") ?? ""),
                    reducer: {
                        SignIn()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
