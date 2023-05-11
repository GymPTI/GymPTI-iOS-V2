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
            HStack(spacing: 60) {
                
                Spacer()
                
                Button(action: { selected = "home" }) {
                    Image(systemName: "house")
                }
                
                Button(action: { selected = "routine" }) {
                    Image(systemName: "pencil")
                }
                
                Button(action: { selected = "profile" }) {
                    Image(systemName: "person")
                }

                Spacer()
            }
            .frame(maxHeight: 48)
            .background(.black)
        }
        
    }
}
