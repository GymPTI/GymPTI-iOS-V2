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
        
        VStack(spacing: 0) {
            
            CustomNavigationBar(title: "회원가입 하기") {
                viewStore.send(.onTapBackButton)
            }
            
            VStack(spacing: 10) {
                
                Text("아이디")
                    .setFont(24, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomTextField(text: viewStore.$id, isSecurable: false)
                
                Text("4~20자의 영문 소/대문자를 입력해주세요")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomButton("다음", disabled: !viewStore.id.regex("[a-zA-Z0-9]{4,20}")) {
                    viewStore.send(.onTapNextButton)
                }
                .padding(.top, 60)
                .padding(.horizontal, 100)
                
                Spacer()
            }
            .padding([.top, .horizontal], 20)
            
        }
        .setBackground()
    }
}
