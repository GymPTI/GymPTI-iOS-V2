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
        
        ZStack {

            VStack(spacing: 0) {
                
                HStack {
                    
                    Button {
                        viewStore.send(.onTapBackButton)
                    } label: {
                        Image("Back")
                            .resizable()
                            .frame(width: 9, height: 15)
                    }
                    .frame(width: 42, height: 36)
                    .padding(.bottom, 6)
                    
                    Spacer()
                    
                    Text("로그인 하기")
                        .setFont(18, .semibold)
                        .foregroundColor(Colors.white.color)
                        .padding(.bottom, 6)
                        .padding(.trailing, 42)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                
                VStack(spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("아이디")
                            .setFont(24, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        CustomTextField(text: viewStore.$id, isSecurable: false)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("비밀번호")
                            .setFont(24, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        CustomTextField(text: viewStore.$pw, isSecurable: true)
                    }
                    
                    CustomButton("로그인", disabled: viewStore.id == "" || viewStore.pw == "" ? true : false) {
                        viewStore.send(.onTapSignInButton)
                    }
                    .padding(.horizontal, 100)
                    .padding(.top, 20)
                    
                    Button {
                        viewStore.send(.onTapSignInButton)
                        KeyboardManager.downKeyborad()
                    } label: {
                        Text("아이디 혹은 비밀번호 찾기")
                            .setFont(14, .medium)
                            .foregroundColor(Colors.white.color)
                    }
                }
                .padding([.top, .horizontal], 20)
                
                Spacer()
            }
            .setBackground()
            
            if viewStore.isLoging {
                LoadingView()
            }
        }
    }
}
