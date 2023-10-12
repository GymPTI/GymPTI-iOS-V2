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
                if let age = Int(items["setpersonalprofile-age"] ?? ""),
                   let height = Int(items["setpersonalprofile-height"] ?? ""),
                   let weight = Int(items["setpersonalprofile-weight"] ?? "") {
                    SetPersonalProfileView(store: .init(
                        initialState: SetPersonalProfile.State(
                            gender: items["setpersonalprofile-gender"] ?? "",
                            age: age,
                            height: height,
                            weight: weight),
                        reducer: {
                            SetPersonalProfile()
                        }))
                    .navigationBarHidden(true)
                }
            }
        }
    }
}
