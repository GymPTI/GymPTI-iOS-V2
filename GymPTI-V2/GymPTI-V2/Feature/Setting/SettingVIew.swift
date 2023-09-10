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
                    
                    Text("정보")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.main.color)
                    
                    SettingButton("비밀번호 수정") {
                        viewStore.send(.onTapEditAccountButton)
                    }
                    
                    SettingButton("상세 정보") {
                        viewStore.send(.onTapEditAccountButton)
                    }
                    
                    Text("기타")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.main.color)
                        .padding(.top, 10)
                    
                    SettingButton("계정 정보 처리 방침") {
                        viewStore.send(.onTapEditAccountButton)
                    }
                    
                    SettingButton("로그아웃") {
                        viewStore.send(.onTapLogoutButton)
                    }
                    
                }
                .padding([.top, .horizontal], 20)
                
                Spacer()
            }
        }
    }
}
