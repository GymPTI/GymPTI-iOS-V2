//
//  EmailView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct EmailView {
    
    private let store: StoreOf<Email>
    @ObservedObject var viewStore: ViewStoreOf<Email>
    
    public init(store: StoreOf<Email>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension EmailView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            CustomNavi("이메일") {
                viewStore.send(.onTapBackButton)
            }
            
            AuthTextfield("이메일을 입력해주세요", text: viewStore.binding(\.$email))
                .padding(.top, 10)
            
            Spacer()
            
            AuthProgress(4)
            
            AuthButton("다음", disabled: !viewStore.email.regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")) {
                viewStore.send(.onTapSendEmailButton)
                KeyboardManager.downKeyborad()
            }
            
        }
        .padding()
        .setBackground()
    }
}
