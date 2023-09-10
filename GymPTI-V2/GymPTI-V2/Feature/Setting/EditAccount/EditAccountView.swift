//
//  EditAccountView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct EditAccountView {
    
    private let store: StoreOf<EditAccount>
    @ObservedObject var viewStore: ViewStoreOf<EditAccount>
    
    public init(store: StoreOf<EditAccount>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension EditAccountView: View {
    
    public var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
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
                
                Text("비밀번호 변경")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .padding(.bottom, 6)
                
                Spacer()
                
                Button {
                    viewStore.send(.onTapChangeButton)
                } label: {
                    Text("저장")
                        .setFont(16, .semibold)
                        .foregroundColor(Colors.white.color)
                        .padding(.trailing, 10)
                }
                .frame(width: 42, height: 36)
                .padding(.bottom, 6)
                .disabled(!viewStore.newPassword.regex("[a-zA-Z0-9!@#$%^*+=-]{8,20}"))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            
            VStack(alignment: .leading) {
                
                Text("이전 비밀번호")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .padding(.top, 10)
                
                CustomTextField(text: viewStore.$oldPassword, isSecurable: true)
                
                Text("새로운 비밀번호")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .padding(.top, 10)
                
                CustomTextField(text: viewStore.$newPassword, isSecurable: true)
                
                Text("8~20자의 영문 소/대문자 또는 기호를 입력해주세요")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
            }
            .padding(.horizontal, 20)
            
            Spacer()
        }
        .setBackground()
    }
}
