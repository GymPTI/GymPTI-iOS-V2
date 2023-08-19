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
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                IdView(store: .init(
                    initialState: Id.State(
                        id: items.getValue(key: "id-id") ?? ""),
                    reducer: {
                        Id()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}

extension [String: String] {
  fileprivate func getValue(key: String) -> String? {
    first(where: { $0.key == key })?.value as? String
  }
}
