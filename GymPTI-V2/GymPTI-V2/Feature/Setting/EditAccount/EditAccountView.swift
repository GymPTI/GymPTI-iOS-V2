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
        
        VStack(alignment: .center) {
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 10, height: 18)
                }
                .frame(width: 32, height: 24)
                
                Spacer()
                
                Text("비밀번호 변경")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                }
                .frame(width: 32, height: 24)
            }
            
            Text("이전 비밀번호")
                .setFont(18, .medium)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            
            CustomTextField(text: viewStore.$oldPassword, isSecurable: true)
            
            Text("새로운 비밀번호")
                .setFont(18, .medium)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 10)
            
            CustomTextField(text: viewStore.$newPassword, isSecurable: true)
            
            Text("*8~20자의 영문 소/대문자 또는 기호를 입력해주세요")
                .setFont(14, .regular)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            
            CustomButton("비밀번호 변경", disabled: !viewStore.newPassword.regex("[a-zA-Z0-9!@#$%^*+=-]{8,20}")) {
                viewStore.send(.onTapChangeButton)
            }
            .padding(.horizontal, 100)
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
        .setBackground()
    }
}
