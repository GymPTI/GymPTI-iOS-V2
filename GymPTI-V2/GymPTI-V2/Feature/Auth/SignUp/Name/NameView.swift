//
//  NameView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct NameView {
    
    private let store: StoreOf<Name>
    @ObservedObject var viewStore: ViewStoreOf<Name>
    
    public init(store: StoreOf<Name>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension NameView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            CustomNavi("이름") {
                viewStore.send(.onTapBackButton)
            }
            
            CustomTextField("이름을 입력해주세요", text: viewStore.binding(\.$name))
                .padding(.top, 10)
            
            Text("*이름은 가입 후 마음껏 바꾸실 수 있어요")
                .setFont(14, .regular)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            AuthProgress(3)
            
            CustomWideButton("다음", disabled: !viewStore.name.regex("[a-zA-Z0-9가-힣]{2,20}")) {
                viewStore.send(.onTapNextButton)
                KeyboardManager.downKeyborad()
            }
        }
        .padding()
        .setBackground()
    }
}
