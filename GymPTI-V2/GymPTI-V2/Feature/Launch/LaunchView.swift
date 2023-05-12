//
//  LaunchView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import LinkNavigator

struct LaunchView: View {
    
    let navigator: LinkNavigatorType
    
    public var body: some View {
        
        ZStack {
            VStack {
                Text("나만의 인공지능 PT 선생님")
                    .setFont(18, .light)
                    .foregroundColor(Colors.white.color)
                Text("GymPTI")
                    .setFont(28, .bold)
                    .foregroundColor(Colors.white.color)
            }
            .padding(40)
        }
        .setBackground()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
                withAnimation(.easeIn) {
                    
                    switch Token.get(.accessToken) == nil {
                        
                    case true:
                        navigator.replace(paths: ["signin"], items: [:], isAnimated: true)
                    case false:
                        navigator.replace(paths: ["tabbar"], items: [:], isAnimated: true)
                    }
                    
                }
            }
        }
    }
}
//.opacity.animation(.easeIn)
