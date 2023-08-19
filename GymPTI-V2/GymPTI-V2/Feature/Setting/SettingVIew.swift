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
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SettingView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 10, height: 18)
                }
                .frame(width: 32, height: 24)
                
                Spacer()
                
                Text("설정")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                }
                .frame(width: 32, height: 24)
            }
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("계정 정보")
                        .setFont(18, .medium)
                        .foregroundColor(Colors.main.color)
                    
                    
                    SettingButton("비밀번호 수정") {
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
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .padding([.top, .horizontal], 20)
        .setBackground()
    }
}
