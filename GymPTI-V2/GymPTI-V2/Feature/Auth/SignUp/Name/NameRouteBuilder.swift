//
//  NameRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

struct NameRouteBuilder: RouteBuilder {
    
    var matchPath: String { "name" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                NameView(store: .init(
                    initialState: Name.State(
                        id: items.getValue(key: "name-id") ?? "",
                        pw: items.getValue(key: "name-pw") ?? "",
                        name: items.getValue(key: "name-name") ?? ""),
                    reducer: {
                        Name()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
