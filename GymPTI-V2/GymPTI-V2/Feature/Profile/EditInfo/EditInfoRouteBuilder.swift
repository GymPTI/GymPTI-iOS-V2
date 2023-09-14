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
        { _, items, _ in
            WrappingController(matchPath: matchPath) {
                EditInfoView(store: .init(
                    initialState: EditInfo.State(
                        profileImage: items.getValue(key: "editinfo-profileImage") ?? "",
                        newName: items.getValue(key: "editinfo-newName") ?? "",
                        newStatusMessage: items.getValue(key: "editinfo-newStatusMessage") ?? ""),
                    reducer: {
                        EditInfo()
                    }))
                .navigationBarHidden(true)
            }
        }
    }
}
