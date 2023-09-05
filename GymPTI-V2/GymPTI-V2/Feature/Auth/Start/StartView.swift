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
        
        VStack(spacing: 20) {
            
            Image("logo")
                .padding([.horizontal, .bottom], 60)
            
            Button {
                viewStore.send(.onTapSignUpButton)
            } label: {
                Text("회원가입 하기")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Colors.main.color)
                    .cornerRadius(50)
                    .padding(.horizontal, 40)
            }
            
            Button {
                viewStore.send(.onTapSignInButton)
            } label: {
                Text("로그인 하기")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
            }
        }
        .setBackground()
    }
}
