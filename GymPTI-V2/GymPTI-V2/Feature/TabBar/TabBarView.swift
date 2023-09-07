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
    @State var isUnconnected = false
    
    
    @ViewBuilder func makeIcon(_ imageName: String) -> some View {
        Button {
            selected = imageName
        } label: {
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
                HomeView(store: .init(initialState: Home.State(), reducer: { Home() }))
                
            case "routine":
                RoutineView(store: .init(initialState: Routine.State(), reducer: { Routine() }))
                
            case "profile":
                
                ProfileView(store: .init(initialState: Profile.State(), reducer: { Profile() }))
                
            default:
                Text("화면이 로딩되지 않습니다.")
                    .onAppear {
                        selected = "home"
                    }
            }
            
            HStack(spacing: 54) {
                
                Spacer()
                
                makeIcon("home")
                makeIcon("routine")
                makeIcon("profile")
                
                Spacer()
            }
            .padding(.bottom, 2)
            .frame(maxHeight: 48)
            .background(Colors.white.color)
        }
        .setBackground()
        .navigationBarHidden(true)
        .onAppear {
            if !isInternetAvailable() {
                isUnconnected = true
            }
        }
        .alert(isPresented: $isUnconnected) {
            Alert(title: Text("실패"),
                  message: Text("인터넷이 연결되지 않았습니다,\n인터넷 연결을 확인하고 재접속 해주세요."),
                  dismissButton: .default(Text("확인")) {
                exit(1)
            })
        }
    }
}
