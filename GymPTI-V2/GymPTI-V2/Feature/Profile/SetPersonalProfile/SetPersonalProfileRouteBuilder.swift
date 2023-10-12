//
//  SetPersonalProfileRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/27.
//

import SwiftUI
import LinkNavigator

struct SetPersonalProfileRouteBuilder: RouteBuilder {
    
    var matchPath: String { "setpersonalprofile" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                SetPersonalProfileView(store: .init(
                    initialState: SetPersonalProfile.State(
                        gender: items.getValue(key: "setpersonalprofile-gender") ?? "",
                        age: items.getIntValue(key: "setpersonalprofile-age") ?? 20,
                        height: items.getIntValue(key: "setpersonalprofile-age") ?? 175,
                        weight: items.getIntValue(key: "setpersonalprofile-age") ?? 55),
                    reducer: {
                        SetPersonalProfile()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}

extension [String: String] {
    
    fileprivate func getIntValue(key: String) -> Int? {
        first(where: { $0.key == key })?.value as? Int
    }
}

