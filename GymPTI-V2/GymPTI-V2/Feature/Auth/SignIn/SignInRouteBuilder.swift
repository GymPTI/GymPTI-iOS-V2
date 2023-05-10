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
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                SignInView(store: .init(
                    initialState: SignIn.State(
                        id: items.getValue(key: "id") ?? "",
                        pw: items.getValue(key: "pw") ?? ""),
                    reducer: SignIn()))
            }
        }
    }
}

extension [String: String] {
  fileprivate func getValue(key: String) -> String? {
    first(where: { $0.key == key })?.value as? String
  }
}

