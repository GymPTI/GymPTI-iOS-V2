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
            
            AuthTextfield("이름을 입력해주세요", text: viewStore.binding(\.$name))
            
            AuthButton("다음", disabled: !viewStore.name.regex("[a-zA-Z0-9가-힣]{2,20}")) {
                viewStore.send(.onTapNextButton)
                KeyboardManager.downKeyborad()
            }
        }
        .padding()
        .setBackground()
    }
}
