//
//  VerificationView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import ComposableArchitecture

public struct VerificationView {
    
    private let store: StoreOf<Verification>
    @ObservedObject var viewStore: ViewStoreOf<Verification>
    
    public init(store: StoreOf<Verification>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension VerificationView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            Button(action: {
                viewStore.send(.onTapBackButton)
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 10, height: 18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            AuthTextfield("인증번호", "인증번호를 입력해주세요", text: viewStore.binding(\.$emailVerificationCode))
                .padding(.top, 10)
            
            Spacer()
            
            AuthProgress(5)
            
            AuthButton("인증 받기", disabled: !viewStore.emailVerificationCode.regex("[0-9]{4}")) {
                viewStore.send(.onTapVerificationButton)
                KeyboardManager.downKeyborad()
            }
            
        }
        .padding()
        .setBackground()
    }
}
