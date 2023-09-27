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
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                SetPersonalProfileView(store: .init(
                    initialState: SetPersonalProfile.State(),
                    reducer: {
                        SetPersonalProfile()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}

