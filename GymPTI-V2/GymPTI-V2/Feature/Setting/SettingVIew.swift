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
            
            CustomNavigationBar(title: "설정") {
                viewStore.send(.onTapBackButton)
            }
            
            SettingScrollView(viewStore: viewStore)
            
        }
        .setBackground()
    }
}

extension SettingView {
    
    struct SettingScrollView: View {
        
        let viewStore: ViewStoreOf<Setting>
        
        init(viewStore: ViewStoreOf<Setting>) {
            self.viewStore = viewStore
        }
        
        var body: some View {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("계정 • 정보 관리")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    SettingButton("비밀번호 변경하기") {
                        viewStore.send(.onTapEditAccountButton)
                    }
                    
                    SettingButton("아이디 찾기 (임시)") {
                        viewStore.send(.test)
                    }
                    
                    SettingButton("신체 정보 수정하기") {
                        
                    }
                    
                    Text("기타")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .padding(.top, 10)
                    
                    SettingButton("계정 정보 처리 방침") {
                        
                    }
                    
                    SettingButton("현재 버전 : \(AppInfoManager.getAppVersion())") {
                        
                    }
                    
                    SettingButton("로그아웃", isDangerous: true) {
                        viewStore.send(.onTapLogoutButton)
                    }
                    
                    SettingButton("탈퇴하기", isDangerous: true) {
                        
                    }
                    
                }
                .padding()
                
                Spacer()
            }
        }
    }
}
