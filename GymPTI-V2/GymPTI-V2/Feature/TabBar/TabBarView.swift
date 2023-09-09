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
            }
            
            HStack(spacing: 54) {
                
                Spacer()
                 
                ForEach(["home", "routine", "profile"], id: \.self) { tabName in
                    
                    Button {
                        viewStore.send(.selectTab(tabName: tabName))
                    } label: {
                        ZStack {
                            if viewStore.selected == tabName {
                                Color.black
                                    .clipShape(Circle())
                                    .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 5))
                                    .frame(width: 48, height: 48)
                            }
                            Image(tabName)
                                .renderingMode(.template)
                                .foregroundColor(viewStore.selected == tabName ? Colors.white.color : Colors.black.color)
                                .frame(width: 48, height: 48)
                        }
                    }
                }
                
                Spacer()
            }
            .padding(.bottom, 2)
            .frame(maxHeight: 48)
            .background(Colors.white.color)
        }
        .setBackground()
        .navigationBarHidden(true)
        .onAppear {
            viewStore.send(.selectTab(tabName: "home"))
            if !isInternetAvailable() {
                
                viewStore.send(.isWifiUnconnected)
            }
        }
    }
}
