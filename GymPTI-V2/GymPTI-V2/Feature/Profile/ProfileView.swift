//
//  ProfileView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture
import CachedAsyncImage

public struct ProfileView {
    
    private let store: StoreOf<Profile>
    @ObservedObject var viewStore: ViewStoreOf<Profile>
    
    public init(store: StoreOf<Profile>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension ProfileView: View {
    
    public var body: some View {
        
        VStack(alignment: .center, spacing: 10) {
            
            Image("profile")
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
            
            Text("이민규")
                .setFont(20, .semibold)
            
            Text("내 꿈은 또 누군가의 꿈이 된다.")
                .setFont(16, .medium)
            
            AuthButton("정보 수정하기", disabled: false) {
                viewStore.send(.onTapEditInfoButton)
            }
            .padding([.top, .horizontal], 20)
            
            AuthButton("계정 수정하기", disabled: false) {
                viewStore.send(.onTapEditAccountButton)
            }
            .padding([.top, .horizontal], 20)
            
            AuthButton("설정하기", disabled: false) {
                viewStore.send(.onTapSettingButton)
            }
            .padding([.top, .horizontal], 20)
        }
        .setBackground()
    }
}
