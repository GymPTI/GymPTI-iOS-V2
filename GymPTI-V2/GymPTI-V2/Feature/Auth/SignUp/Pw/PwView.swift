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
        viewStore = ViewStore(store)
    }
}

extension PwView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            CustomNavi("비밀번호") {
                viewStore.send(.onTapBackButton)
            }
            
            AuthTextfield("비밀번호를 입력해주세요", text: viewStore.binding(\.$pw))
                .padding(.top, 10)
            
            Spacer()
            
            AuthProgress(2)
            
            AuthButton("다음", disabled: !viewStore.pw.regex("[a-zA-Z0-9!@#$%^*+=-]{8,20}")) {
                viewStore.send(.onTapNextButton)
                KeyboardManager.downKeyborad()
            }
        }
        .padding()
        .setBackground()
    }
}
