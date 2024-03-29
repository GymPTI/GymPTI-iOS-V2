//
//  LoadingView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/31.
//

import SwiftUI

struct LoadingView: View {
    
    let loadingType: LoadingType
    
    var message: String {
        switch loadingType {
        case .sendEmail:
            "이메일을 보내는 중..."
        case .createAiRotine:
            "루틴을 생성하는 중..."
        case .login:
            "로그인 중..."
        }
    }

    @State var isFirstCircleAnimating = false
    @State var isSecondCircleAnimating = false
    @State var isThirdCircleAnimating = false
    
    init(loadingType: LoadingType) {
        self.loadingType = loadingType
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text(message)
            .foregroundStyle(Colors.white.color)
            .setFont(14, .medium)
           
            HStack(alignment: .center) {
                
                Circle()
                    .fill(Colors.main.color)
                    .frame(width: 16, height: 16)
                    .scaleEffect(isFirstCircleAnimating ? 1.0 : 0.5)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                            self.isFirstCircleAnimating = true
                        }
                    }
                
                Circle()
                    .fill(Colors.main.color)
                    .frame(width: 16, height: 16)
                    .scaleEffect(isSecondCircleAnimating ? 1.0 : 0.5)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true).delay(0.3)) {
                            self.isSecondCircleAnimating = true
                        }
                    }
                
                Circle()
                    .fill(Colors.main.color)
                    .frame(width: 16, height: 16)
                    .scaleEffect(isThirdCircleAnimating ? 1.0 : 0.5)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true).delay(0.6)) {
                            self.isThirdCircleAnimating = true
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.66))
    }
}

enum LoadingType {
    case sendEmail
    case createAiRotine
    case login
}
