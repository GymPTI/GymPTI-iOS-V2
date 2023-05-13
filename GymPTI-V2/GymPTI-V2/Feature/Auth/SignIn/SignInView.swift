//
//  SignInView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct SignInView {
    
    private let store: StoreOf<SignIn>
    @ObservedObject var viewStore: ViewStoreOf<SignIn>
    
    public init(store: StoreOf<SignIn>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension SignInView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            VStack(spacing: 10) {
                Text("GymPTI")
                    .setFont(32, .bold)
                    .foregroundColor(Colors.white.color)
                
                Text("나만의 인공지능 PT 선생님")
                    .setFont(16, .regular)
                    .foregroundColor(Colors.white.color)
            }
            .padding(.top, UIScreen.main.bounds.size.height / 8)
            
            Spacer()
            
            VStack(spacing: 20) {
                
                CustomTextField("아이디를 입력해주세요", text: viewStore.binding(\.$id))
                
                CustomSecureField("비밀번호를 입력해주세요.", text: viewStore.binding(\.$pw))
                
                CustomWideButton("로그인", disabled: false) {
                    viewStore.send(.onTapSignInButton)
                }
                
                HStack {
                    Text("계정이 없으신가요?")
                        .setFont(14, .regular)
                        .foregroundColor(Colors.white.color)
                    
                    Button(action: {
                        viewStore.send(.onTapSignUpButton)
                        KeyboardManager.downKeyborad()
                    }) {
                        Text("회원가입 하러가기!")
                            .setFont(15, .bold)
                            .foregroundColor(Colors.main.color)
                    }
                }
                .padding(.bottom, UIScreen.main.bounds.size.height / 12)
                
            }
            
        }
        .padding(.horizontal, 20)
        .setBackground()
    }
}
