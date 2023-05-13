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
        viewStore = ViewStore(store)
    }
}

extension EmailView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            CustomNavi("이메일") {
                viewStore.send(.onTapBackButton)
            }
             
            CustomTextField("이메일을 입력해주세요", text: viewStore.binding(\.$email))
                .padding(.top, 10)
            
            Text("*인증번호를 받으실 이메일을 입력해주세요")
                .setFont(14, .regular)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            AuthProgress(4)
            
            CustomWideButton("다음", disabled: !viewStore.email.regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")) {
                viewStore.send(.onTapSendEmailButton)
                KeyboardManager.downKeyborad()
            }
            
        }
        .padding()
        .setBackground()
    }
}
