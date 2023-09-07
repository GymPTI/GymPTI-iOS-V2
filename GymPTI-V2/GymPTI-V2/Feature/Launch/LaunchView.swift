//
//  LaunchView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import LinkNavigator
import Alamofire

struct LaunchView: View {
    
    @State var isCennect: Bool = false
    
    let navigator: LinkNavigatorType
    
    public var body: some View {
        
        ZStack {
            Image("logo")
                .padding(.bottom, 40)
        }
        .setBackground()
        .onAppear {
            Task {
                try await Task.sleep(nanoseconds: UInt64(1.5))
                
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
