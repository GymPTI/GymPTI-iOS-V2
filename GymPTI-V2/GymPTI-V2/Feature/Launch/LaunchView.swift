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
            Image("logo")
                .padding(.bottom, 40)
        }
        .setBackground()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                
                withAnimation(.easeIn) {
                    
                    switch Token.get(.accessToken) == nil {
                        
                    case true:
                        navigator.replace(paths: ["start"], items: [:], isAnimated: true)
                    case false:
                        navigator.replace(paths: ["tabbar"], items: [:], isAnimated: true)
                    }
                    
                }
            }
        }
    }
}
