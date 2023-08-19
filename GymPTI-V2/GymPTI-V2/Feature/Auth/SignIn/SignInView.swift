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
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SignInView: View {
    
    public var body: some View {
        
        VStack {
            
            Button(action: {
                viewStore.send(.onTapBackButton)
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 10, height: 18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 20) {
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("아이디")
                        .setFont(24, .semibold)
                        .foregroundColor(Colors.white.color)
                    
                    CustomTextField(text: viewStore.$id)
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    
                    Text("비밀번호")
                        .setFont(24, .semibold)
                        .foregroundColor(Colors.white.color)
                    
                    CustomTextField(text: viewStore.$pw)
                }
                
                CustomButton("로그인", disabled: viewStore.id == "" || viewStore.pw == "" ? true : false) {
                    viewStore.send(.onTapSignInButton)
                    KeyboardManager.downKeyborad()
                }
                .padding(.horizontal, 60)
                .padding(.top, 20)
                
                Button(action: {
                    viewStore.send(.onTapSignInButton)
                    KeyboardManager.downKeyborad()
                }) {
                    Text("아이디 혹은 비밀번호 찾기")
                        .setFont(14, .medium)
                        .foregroundColor(Colors.white.color)
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding([.top, .horizontal], 20)
        .setBackground()
    }
}
