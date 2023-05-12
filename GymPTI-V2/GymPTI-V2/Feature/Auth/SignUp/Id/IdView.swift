//
//  IdView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct IdView {
    
    private let store: StoreOf<Id>
    @ObservedObject var viewStore: ViewStoreOf<Id>
    
    public init(store: StoreOf<Id>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension IdView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            Button(action: {
                viewStore.send(.onTapBackButton)
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 10, height: 18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            AuthTextfield("아이디", "아이디를 입력해주세요", text: viewStore.binding(\.$id))
                .padding(.top, 10)
            
            Spacer()
            
            AuthProgress(1)
            
            AuthButton("다음", disabled: !viewStore.id.regex("[a-zA-Z0-9]{4,20}")) {
                viewStore.send(.onTapNextButton)
                KeyboardManager.downKeyborad()
            }
            
        }
        .padding()
        .setBackground()
    }
}
