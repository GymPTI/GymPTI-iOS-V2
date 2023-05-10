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
            
            TextField("아이디를 입력해주세요", text: viewStore.binding(\.$id))
                .foregroundColor(.white)
            
            TextField("비밀번호를 입력해주세요.", text: viewStore.binding(\.$pw))
                .foregroundColor(.white)
            
            Button("로그인") {
                viewStore.send(.onTapSignInButton)
            }
            
            Button("회원가입") {
                viewStore.send(.onTapSignUpButton)
                KeyboardManager.downKeyborad()
            }
        }
        .padding()
        .setBackground()
    }
}
