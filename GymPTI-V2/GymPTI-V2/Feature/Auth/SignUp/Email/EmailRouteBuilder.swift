//
//  EmailRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import LinkNavigator

struct EmailRouteBuilder: RouteBuilder {
    
    var matchPath: String { "email" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                EmailView(store: .init(
                    initialState: Email.State(
                        id: items.getValue(key: "email-id") ?? "",
                        pw: items.getValue(key: "email-pw") ?? "",
                        name: items.getValue(key: "email-name") ?? ""),
                    reducer: {
                        Email()
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
