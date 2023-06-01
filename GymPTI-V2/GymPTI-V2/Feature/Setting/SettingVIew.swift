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
        
        VStack(spacing: 0) {
            
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
                    .setFont(38, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("계정 정보")
                    .setFont(18, .medium)
                    .foregroundColor(Colors.main.color)
                
                
                SettingButton("계정 정보 수정") {
                    viewStore.send(.onTapEditAccountButton)
                }
                
                Text("기타")
                    .setFont(18, .medium)
                    .foregroundColor(Colors.main.color)
                    .padding(.top, 10)
                
                SettingButton("계정 정보 처리 방침") {
                    viewStore.send(.onTapEditAccountButton)
                }
                
                SettingButton("로그아웃") {
                    viewStore.send(.onTapLogoutButton)
                }
                
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding([.top, .horizontal], 20)
        .setBackground()
    }
}
