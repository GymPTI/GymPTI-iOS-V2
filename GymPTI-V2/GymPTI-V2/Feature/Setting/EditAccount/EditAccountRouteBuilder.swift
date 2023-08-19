//
//  EditAccountRouteBuilder.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import LinkNavigator

struct EditAccountRouteBuilder: RouteBuilder {
    
    var matchPath: String { "editaccount" }
    
    var build: (LinkNavigatorType, [String : String], DependencyType) -> MatchingViewController? {
        { _, _, _ in
            WrappingController(matchPath: matchPath) {
                EditAccountView(store: .init(
                    initialState: EditAccount.State(),
                    reducer: {
                        EditAccount()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
