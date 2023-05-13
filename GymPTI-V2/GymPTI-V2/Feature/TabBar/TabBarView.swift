//
//  TabBarView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

struct TabBarView: View {
    
    @State var selected: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            switch selected {
                
            case "home":
                HomeView(store: .init(initialState: Home.State(), reducer: Home()))
                
            case "routine":
                RoutineView(store: .init(initialState: Routine.State(), reducer: Routine()))
                
            case "friend":
                FriendView(store: .init(initialState: Friend.State(), reducer: Friend()))
                
            case "profile":
                ProfileView(store: .init(initialState: Profile.State(), reducer: Profile()))
                
            default:
                Text("화면이 로딩되지 않습니다.")
                    .onAppear {
                        selected = "home"
                    }
            }
            HStack(spacing: 32) {
                
                Spacer()
                
                Button(action: { selected = "home" }) {
                    if selected == "home" {
                        Image("home.selected")
                    } else {
                        Image("home")
                    }
                }
                .frame(width: 50)
                
                Button(action: { selected = "routine" }) {
                    if selected == "routine" {
                        Image("routine.selected")
                    } else {
                        Image("routine")
                    }
                }
                .frame(width: 50)
                
                Button(action: { selected = "friend" }) {
                    if selected == "friend" {
                        Image("friend.selected")
                    } else {
                        Image("friend")
                    }
                }
                .frame(width: 50)
                
                Button(action: { selected = "profile" }) {
                    if selected == "profile" {
                        Image("profile.selected")
                    } else {
                        Image("profile")
                    }
                }
                .frame(width: 50)

                Spacer()
            }
            .frame(maxHeight: 44)
            .background(Colors.white.color)
        }
        .background(Colors.white.color)
        .navigationBarHidden(true)
        
    }
}
