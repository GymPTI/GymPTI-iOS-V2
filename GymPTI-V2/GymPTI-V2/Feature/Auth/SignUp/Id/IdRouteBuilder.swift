//
//  IdRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import LinkNavigator

struct IdRouteBuilder: RouteBuilder {
    
    var matchPath: String { "id" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                IdView(store: .init(
                    initialState: Id.State(
                        id: items.getValue(key: "id-id") ?? ""),
                    reducer: Id()))
            }
        }
    }
}

extension [String: String] {
  fileprivate func getValue(key: String) -> String? {
    first(where: { $0.key == key })?.value as? String
  }
}
