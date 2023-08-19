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
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension IdView: View {
    
    public var body: some View {
        
        VStack(spacing: 10) {
            
            VStack {
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 10, height: 18)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("아이디")
                    .setFont(38, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            CustomTextField(text: viewStore.$id)
                .padding(.top, 10)
            
            Text("*4~20자의 영문 소/대문자를 입력해주세요")
                .setFont(12, .regular)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            CustomButton("다음", disabled: !viewStore.id.regex("[a-zA-Z0-9]{4,20}")) {
                viewStore.send(.onTapNextButton)
                KeyboardManager.downKeyborad()
            }
            .padding(.top, 60)
            .padding(.horizontal, 100)
            
            Spacer()
        }
        .padding()
        .setBackground()
    }
}
