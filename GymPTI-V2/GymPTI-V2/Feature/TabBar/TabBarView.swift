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
                
            case "profile":
                ProfileView(store: .init(initialState: Profile.State(), reducer: Profile()))
                
            default:
                HomeView(store: .init(initialState: Home.State(), reducer: Home()))
            }
            HStack(spacing: 46) {
                
                Spacer()
                
                Button(action: { selected = "home" }) {
                    if selected == "home" {
                        Image("tabbar.Home.selected")
                    } else {
                        Image("tabbar.Home")
                    }
                }
                .frame(width: 50)
                
                Button(action: { selected = "routine" }) {
                    if selected == "routine" {
                        Image("tabbar.Routine.selected")
                    } else {
                        Image("tabbar.Routine")
                    }
                }
                .frame(width: 50)
                
                Button(action: { selected = "profile" }) {
                    if selected == "profile" {
                        Image("tabbar.Profile.selected")
                    } else {
                        Image("tabbar.Profile")
                    }
                }
                .frame(width: 50)

                Spacer()
            }
            .frame(maxHeight: 48)
            .background(Colors.white.color)
        }
        
    }
}
