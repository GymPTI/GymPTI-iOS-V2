//
//  EditInfoView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct EditInfoView {
    
    private let store: StoreOf<EditInfo>
    @ObservedObject var viewStore: ViewStoreOf<EditInfo>
    
    public init(store: StoreOf<EditInfo>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension EditInfoView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            AuthTextfield("바꿀 닉네임을 입력해주세요.", text: viewStore.binding(\.$newNickname))
            
            AuthButton("닉네임 변경", disabled: false) {
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
