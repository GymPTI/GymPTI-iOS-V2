//
//  TabBarView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

struct TabBarView: View {
    
    @State var home: Bool = true
    @State var routine: Bool = false
    @State var profile: Bool = false
    
    var body: some View {
        
        VStack {
            
            if home {
                HomeView(store: .init(
                    initialState: Home.State(),
                    reducer: Home()))
            } else if routine {
                RoutineView(store: .init(
                    initialState: Routine.State(),
                    reducer: Routine()))
            } else if profile {
                ProfileView(store: .init(
                    initialState: Profile.State(),
                    reducer: Profile()))
            }
            
            Spacer()
            
            HStack {
                
                Spacer()
                
                Button("홈") {
                    print("홈")
                    home = true
                    routine = false
                    profile = false
                }
                
                Spacer()
                
                Button("버튼") {
                    print("루틴")
                    routine = true
                    home = false
                    profile = false
                }
                
                Spacer()
                
                Button("버튼") {
                    print("프로필")
                    profile = true
                    home = false
                    routine = false
                }
                
                Spacer()
            }
            .frame(height: 66)
            .background(.pink)
            
        }
    }
}
