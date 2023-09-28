//
//  EditPasswordView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct EditPasswordView {
    
    private let store: StoreOf<EditPassword>
    @ObservedObject var viewStore: ViewStoreOf<EditPassword>
    
    public init(store: StoreOf<EditPassword>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension EditPasswordView: View {
    
    public var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            CustomNavigationBar(title: "비밀번호 변경", leadingButtonAction: {
                    viewStore.send(.onTapBackButton)
                }, trailingButtonTitle: "저장", trailingButtonAction: {
                    viewStore.send(.onTapChangeButton)
                }, trailingButtonDisabled: !viewStore.newPassword.regex("[a-zA-Z0-9!@#$%^*+=-]{8,20}"))
            
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
