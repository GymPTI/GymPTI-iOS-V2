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
            
            Text("GymPTI")
                .setFont(48, .bold)
                .foregroundColor(.white)
                .padding([.top, .bottom], 40)
            
            AuthTextfield("아이디", "아이디를 입력해주세요", text: viewStore.binding(\.$id))
            
            AuthSecurefield("비밀번호", "비밀번호를 입력해주세요.", text: viewStore.binding(\.$pw))
                .padding(.top, 20)
            
            Spacer()
            
            AuthButton("로그인", disabled: false) {
                viewStore.send(.onTapSignInButton)
            }
            .padding(.bottom, 10)
            
            HStack {
                Text("계정이 없으신가요?")
                    .setFont(14, .regular)
                    .foregroundColor(.white)
                
                Button(action: {
                    viewStore.send(.onTapSignUpButton)
                    KeyboardManager.downKeyborad()
                }) {
                    Text("계정이 없으신가요?")
                        .setFont(14, .regular)
                        .foregroundColor(Color.accentColor)
                }
            }
            .padding(.bottom, 10)
        }
        .padding(.horizontal, 20)
        .setBackground()
    }
}
