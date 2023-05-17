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
        viewStore = ViewStore(store)
    }
}

extension EditAccountView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavi("계정 정보 수정") {
                viewStore.send(.onTapBackButton)
            }
            
            Text("이전 비밀번호")
                .setFont(18, .medium)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top], 10)
            
            CustomSecureField("이전 비밀번호를 입력해주세요.", text: viewStore.binding(\.$oldPassword))
            
            Text("새로운 비밀번호")
                .setFont(18, .medium)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top], 10)
            
            CustomTextField("새로운 비밀번호를 입력해주세요.", text: viewStore.binding(\.$newPassword))
            
            Text("*8~20자의 영문 소/대문자 또는 기호를 입력해주세요")
                .setFont(14, .regular)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
            
            Spacer()
            
            CustomWideButton("비밀번호 변경", disabled: !viewStore.newPassword.regex("[a-zA-Z0-9!@#$%^*+=-]{8,20}")) {
                viewStore.send(.onTapChangeButton)
            }
        }
        .padding()
        .setBackground()
    }
}
