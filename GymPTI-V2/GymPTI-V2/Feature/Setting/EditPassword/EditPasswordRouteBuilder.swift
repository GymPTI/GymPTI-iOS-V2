//
//  EditPasswordRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import LinkNavigator

struct EditPasswordRouteBuilder: RouteBuilder {
    
    var matchPath: String { "editpassword" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                EditPasswordView(store: .init(
                    initialState: EditPassword.State(),
                    reducer: {
                        EditPassword()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
