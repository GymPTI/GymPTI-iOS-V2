//
//  TabBarView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

struct TabBarView: View {
    
    @Namespace var animation
    @State var selected: String
    
    @ViewBuilder func makeIcon(_ imageName: String) -> some View {
        Button(action: { selected = imageName }) {
            ZStack {
                if selected == imageName {
                    Color.black
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(Color.white, lineWidth: 5))
                        .frame(width: 48, height: 48)
                        .matchedGeometryEffect(id: "a", in: animation)
                }
                Image(imageName)
                    .renderingMode(.template)
                    .foregroundColor(selected == imageName ? Colors.white.color : Colors.black.color)
                    .frame(width: 48, height: 48)
            }
        }
    }
    
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
                
                makeIcon("home")
                makeIcon("routine")
                makeIcon("friend")
                makeIcon("profile")

                Spacer()
            }
            .padding(.bottom, 2)
            .frame(maxHeight: 48)
            .background(Colors.white.color)
        }
        .setBackground()
        .navigationBarHidden(true)
    }
}
