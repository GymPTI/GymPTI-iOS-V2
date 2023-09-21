//
//  TabBarView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture


import SwiftUI
import ComposableArchitecture

public struct TabBarView {
    
    private let store: StoreOf<TabBar>
    @ObservedObject var viewStore: ViewStoreOf<TabBar>
    
    public init(store: StoreOf<TabBar>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension TabBarView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            switch viewStore.selected {
                
            case "home":
                HomeView(store: .init(initialState: Home.State(), reducer: { Home() }))
                
            case "routine":
                RoutineView(store: .init(initialState: Routine.State(), reducer: { Routine() }))
                
            case "profile":
                
                ProfileView(store: .init(initialState: Profile.State(), reducer: { Profile() }))
            default:
                
                HomeView(store: .init(initialState: Home.State(), reducer: { Home() }))
                    .task {
                        viewStore.send(.selectTab(tabName: "home"))
                    }
            }
            
            HStack(spacing: 0) {
                
                Spacer()
                 
                ForEach([("home", "홈"), ("routine", "루틴"), ("profile", "프로필")], id: \.0) { tab in
                    
                    let tabName = tab.0
                    Button {
                        viewStore.send(.selectTab(tabName: tabName))
                    } label: {
                        VStack(spacing: 2) {
                            Image(viewStore.selected == tabName ? "\(tabName).selected" : tabName)
                                .resizable()
                                .opacity(viewStore.selected == tabName ? 1 : 0.5)
                                .frame(width: 28, height: 28)
                            
                            Text("\(tab.1)")
                                .setFont(12, .medium)
                                .foregroundColor(Colors.white.color)
                                .opacity(viewStore.selected == tabName ? 1 : 0.5)
                        }
                        .frame(width: 124, height: 52)
                        .foregroundColor(Colors.black.color)
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 2)
            .frame(height: 52)
        }
        .setBackground()
        .navigationBarHidden(true)
        .onAppear {
            if !isInternetAvailable() {
                viewStore.send(.isWifiUnconnected)
            }
        }
    }
}
