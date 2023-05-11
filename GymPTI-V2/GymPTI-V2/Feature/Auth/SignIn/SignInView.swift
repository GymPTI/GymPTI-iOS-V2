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
            
            AuthTextfield("아이디를 입력해주세요", text: viewStore.binding(\.$id))
            
            AuthSecurefield("비밀번호를 입력해주세요.", text: viewStore.binding(\.$pw))
                .padding(.top, 20)
            
            AuthButton("로그인", disabled: false) {
                viewStore.send(.onTapSignInButton)
            }
            .padding(.top, 20)
            
            HStack {
                Text("계정이 없으신가요?")
                
                Button("계정 만들기") {
                    viewStore.send(.onTapSignUpButton)
                    KeyboardManager.downKeyborad()
                }
            }
        }
        .padding()
        .setBackground()
    }
}
