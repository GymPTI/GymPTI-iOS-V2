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
        
        VStack(spacing: 10) {
            
            VStack {
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("back")
                        .resizable()
                        .frame(width: 10, height: 18)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("이메일")
                    .setFont(38, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
             
            CustomTextField(text: viewStore.$email)
                .padding(.top, 10)
            
            Text("*인증번호를 받으실 이메일을 입력해주세요")
                .setFont(12, .regular)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            CustomButton("다음", disabled: !viewStore.email.regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")) {
                viewStore.send(.onTapSendEmailButton)
                KeyboardManager.downKeyborad()
            }
            .padding(.top, 60)
            .padding(.horizontal, 100)
            
            Spacer()
        }
        .padding()
        .setBackground()
    }
}
