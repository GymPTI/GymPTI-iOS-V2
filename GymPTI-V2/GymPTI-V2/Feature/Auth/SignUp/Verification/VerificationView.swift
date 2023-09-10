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
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension VerificationView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            CustomNavigationBar(title: "회원가입 하기") {
                viewStore.send(.onTapBackButton)
            }
            
            VStack(spacing: 10) {
                
                Text("인증번호")
                    .setFont(24, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomTextField(text: viewStore.$emailVerificationCode, isSecurable: false)
                
                Text("받으신 인증번호를 입력해주세요")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomButton("다음", disabled: !viewStore.emailVerificationCode.regex("[0-9]{4}")) {
                    viewStore.send(.onTapVerificationButton)
                }
                .padding(.top, 60)
                .padding(.horizontal, 100)
                
                Spacer()            }
            .padding([.top, .horizontal], 20)
            
        }
        .setBackground()
    }
    
}
