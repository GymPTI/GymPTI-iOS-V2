//
//  MainView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import LinkNavigator
import ComposableArchitecture

struct MainView: View {
    
    @State private var selected: Int = 0
    
    let navigator: LinkNavigatorType
    
    var body: some View {
        TabView(selection: $selected) {
            HomeView(store: )
                .tag(0)
                .tabItem {
                    Label("홈", systemImage: "house")
                        .environment(\.symbolVariants, selected == 0 ? .fill : .none)
                }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(["홈"][selected])
    }
}

