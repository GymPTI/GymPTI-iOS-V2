//
//  EmailView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct EmailView {
    
    private let store: StoreOf<Email>
    @ObservedObject var viewStore: ViewStoreOf<Email>
    
    public init(store: StoreOf<Email>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension EmailView: View {
    
    public var body: some View {
        
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
                
                Text("회원가입 하기")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .padding(.bottom, 6)
                    .padding(.trailing, 42)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            
            VStack(spacing: 10) {
                
                Text("이메일")
                    .setFont(24, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomTextField(text: viewStore.$email, isSecurable: false)
                
                Text("인증번호를 받으실 이메일을 입력해주세요")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomButton("다음", disabled: !viewStore.email.regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")) {
                    viewStore.send(.onTapSendEmailButton)
                }
                .padding(.top, 60)
                .padding(.horizontal, 100)
                
                Spacer()
            }
            .padding([.top, .horizontal], 20)
            
        }
        .setBackground()
    }
}
