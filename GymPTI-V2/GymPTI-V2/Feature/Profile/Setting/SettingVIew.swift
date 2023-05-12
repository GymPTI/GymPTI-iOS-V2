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
            
            CustomNavi("설정") {
                viewStore.send(.onTapBackButton)
            }
            
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
