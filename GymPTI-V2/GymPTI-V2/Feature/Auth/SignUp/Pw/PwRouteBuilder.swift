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
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                PwView(store: .init(
                    initialState: Pw.State(
                        id: items.getValue(key: "pw-id") ?? "",
                        pw: items.getValue(key: "pw-pw") ?? ""),
                    reducer: Pw()))
            }
        }
    }
}

extension [String: String] {
    fileprivate func getValue(key: String) -> String? {
        first(where: { $0.key == key })?.value as? String
    }
}
