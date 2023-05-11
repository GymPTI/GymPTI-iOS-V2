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
            
            switch viewStore.isSendEmail {
                
            case true:
                
                AuthTextfield("인증번호를 입력해주세요", text: viewStore.binding(\.$emailVerificationCode))
                
                AuthButton("인증 받기", disabled: !viewStore.emailVerificationCode.regex("[0-9]{4}")) {
                    viewStore.send(.onTapVerificationButton)
                    KeyboardManager.downKeyborad()
                }
                
            case false:
                
                AuthTextfield("이메일을 입력해주세요", text: viewStore.binding(\.$email))
                
                AuthButton("다음", disabled: !viewStore.email.regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")) {
                    viewStore.send(.onTapSendEmailButton)
                    KeyboardManager.downKeyborad()
                }
            }
        }
        .padding()
        .setBackground()
    }
}
