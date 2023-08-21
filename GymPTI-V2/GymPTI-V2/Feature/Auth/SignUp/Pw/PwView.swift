//
//  PwView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct PwView {
    
    private let store: StoreOf<Pw>
    @ObservedObject var viewStore: ViewStoreOf<Pw>
    
    public init(store: StoreOf<Pw>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension PwView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
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
                
                Text("비밀번호")
                    .setFont(24, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomTextField(text: viewStore.$pw, isSecurable: true)
                
                Text("8~20자의 영문 소/대문자 또는 기호를 입력해주세요")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomButton("다음", disabled: !viewStore.pw.regex("[a-zA-Z0-9!@#$%^*+=-]{8,20}")) {
                    viewStore.send(.onTapNextButton)
                    KeyboardManager.downKeyborad()
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
