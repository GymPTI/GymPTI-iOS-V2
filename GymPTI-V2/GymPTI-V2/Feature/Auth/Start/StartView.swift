//
//  StartView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/18.
//

import SwiftUI
import ComposableArchitecture

public struct StartView {
    
    private let store: StoreOf<Start>
    @ObservedObject var viewStore: ViewStoreOf<Start>
    
    public init(store: StoreOf<Start>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension StartView: View {
    
    public var body: some View {
        
        VStack(spacing: 15) {
            Spacer()
            
            Image("logo")
//                .padding(.horizontal, 60)
            
            Spacer()
            
            CustomButton("로그인 하기", disabled: false) {
                viewStore.send(.onTapSignInButton)
            }
            .padding(.horizontal, 50)
            
            HStack(spacing: 2) {
                Text("계정이 없으신가요?")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
                
                Button {
                    viewStore.send(.onTapSignUpButton)
                } label: {
                    Text("회원가입 하기")
                        .setFont(14, .bold)
                        .foregroundColor(Colors.white.color)
                }
            }
            .padding(.bottom, 20)
        }
        .setBackground()
    }
}
