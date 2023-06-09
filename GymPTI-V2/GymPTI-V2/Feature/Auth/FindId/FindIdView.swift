//
//  FindIdView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import ComposableArchitecture

public struct FindIdView {
    
    private let store: StoreOf<FindId>
    @ObservedObject var viewStore: ViewStoreOf<FindId>
    
    public init(store: StoreOf<FindId>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension FindIdView: View {
    
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
                
                Text("아이디 찾기")
                    .setFont(38, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            CustomTextField("이메일을 입력해주세요.", text: viewStore.binding(\.$email))
            
            Spacer()
            
            CustomWideButton("찾기", disabled: !viewStore.email.regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")) {
                viewStore.send(.onTapFindIdButton)
                KeyboardManager.downKeyborad()
            }
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
    }
}
