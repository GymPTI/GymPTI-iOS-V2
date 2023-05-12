//
//  VerificationRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import LinkNavigator

struct VerificationRouteBuilder: RouteBuilder {
    
    var matchPath: String { "verification" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                VerificationView(store: .init(
                    initialState: Verification.State(
                        id: items.getValue(key: "verification-id") ?? "",
                        pw: items.getValue(key: "verification-pw") ?? "",
                        name: items.getValue(key: "verification-name") ?? "",
                        email: items.getValue(key: "verification-email") ?? ""),
                    reducer: Verification()))
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
