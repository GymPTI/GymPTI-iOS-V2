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
            
            Button(action: {
                viewStore.send(.onTapBackButton)
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 10, height: 18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("비밀번호 변경하기")
                .setFont(32, .bold)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            AuthSecurefield("이전 비밀번호", "이전 비밀번호를 입력해주세요.", text: viewStore.binding(\.$oldPassword))
            
            AuthSecurefield("새로운 비밀번호", "바꿀 비밀번호를 입력해주세요.", text: viewStore.binding(\.$newPassword))
            
            Spacer()
            
            AuthButton("비밀번호 변경", disabled: false) {
                viewStore.send(.onTapChangeButton)
            }
        }
        .padding(.horizontal, 20)
        .setBackground()
    }
}
