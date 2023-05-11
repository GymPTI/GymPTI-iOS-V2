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
        
        VStack {
            
            switch selected {
                
            case "home":
                HomeView(store: .init(
                    initialState: Home.State(),
                    reducer: Home()))
                
            case "routine":
                RoutineView(store: .init(
                    initialState: Routine.State(),
                    reducer: Routine()))
                
            case "profile":
                ProfileView(store: .init(
                    initialState: Profile.State(),
                    reducer: Profile()))
                
            default:
                HomeView(store: .init(
                    initialState: Home.State(),
                    reducer: Home()))
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    selected = "home"
                }) {
                    Image(systemName: "house")
                }
                
                Spacer()
                
                Button(action: {
                    selected = "routine"
                }) {
                   Image(systemName: "pencil")
                }
                
                Spacer()
                
                Button(action: {
                    selected = "profile"
                }) {
                    Image(systemName: "person")
                }
                
                Spacer()
            }
            .frame(height: 48)
            .background(.white)
        }
    }
}
