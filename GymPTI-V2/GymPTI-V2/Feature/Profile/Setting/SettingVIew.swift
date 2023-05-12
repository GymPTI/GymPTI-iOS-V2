//
//  SettingVIew.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct SettingView {
    
    private let store: StoreOf<Setting>
    @ObservedObject var viewStore: ViewStoreOf<Setting>
    
    public init(store: StoreOf<Setting>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension SettingView: View {
    
    public var body: some View {
        
        VStack {
            
            Button(action: {
                viewStore.send(.onTapBackButton)
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 10, height: 18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("설정")
                .setFont(34, .bold)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
            
            Spacer()
            
            Button(action: {
                viewStore.send(.onTapLogoutButton)
            }) {
                Text("로그아웃")
                    .setFont(18, .medium)
            }
            
            Button(action: {
                viewStore.send(.onTapFindIdButton)
            }) {
                Text("아이디 찾기")
                    .setFont(18, .medium)
            }

            
            Spacer()
        }
        .padding(.horizontal, 20)
        .setBackground()
    }
}
