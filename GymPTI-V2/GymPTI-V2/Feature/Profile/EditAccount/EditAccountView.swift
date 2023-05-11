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
            
            AuthSecurefield("이전 비밀번호를 입력해주세요.", text: viewStore.binding(\.$oldPassword))
            
            AuthSecurefield("바꿀 비밀번호를 입력해주세요.", text: viewStore.binding(\.$newPassword))
            
            AuthButton("비밀번호 변경", disabled: false) {
                viewStore.send(.onTapChangeButton)
            }
        }
        .padding(.horizontal, 20)
        .setBackground()
        .navigationBarItems(
            trailing:
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image(systemName: "pencil")
                }
        )
    }
}
