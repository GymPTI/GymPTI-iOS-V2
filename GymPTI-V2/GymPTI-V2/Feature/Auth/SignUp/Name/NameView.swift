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
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension NameView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 9, height: 15)
                }
                .frame(width: 42, height: 36)
                .padding(.bottom, 6)
                
                Spacer()
                
                Text("회원가입 하기")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .padding(.bottom, 6)
                    .padding(.trailing, 42)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            
            VStack(spacing: 10) {
                
                Text("이름")
                    .setFont(24, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomTextField(text: viewStore.$name)
                
                Text("이름은 가입 후 마음껏 바꾸실 수 있어요")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomButton("다음", disabled: !viewStore.name.regex("[a-zA-Z0-9가-힣 ]{2,20}")) {
                    viewStore.send(.onTapNextButton)
                    KeyboardManager.downKeyborad()
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
