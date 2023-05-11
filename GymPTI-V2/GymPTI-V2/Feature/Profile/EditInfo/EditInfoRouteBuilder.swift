//
//  EditInfoRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import LinkNavigator

struct EditInfoRouteBuilder: RouteBuilder {
    
    var matchPath: String { "editinfo" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { navigator, items, dep in
            WrappingController(matchPath: matchPath) {
                EditInfoView(store: .init(
                    initialState: EditInfo.State(),
                    reducer: EditInfo()))
            }
        }
    }
}
