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
                        gender: items["setpersonalprofile-gender"] ?? "",
                        age: Int(items["setpersonalprofile-age"] ?? "") ?? 0,
                        height: Int(items["setpersonalprofile-height"] ?? "") ?? 0,
                        weight: Int(items["setpersonalprofile-weight"] ?? "") ?? 0),
                    reducer: {
                        SetPersonalProfile()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}

