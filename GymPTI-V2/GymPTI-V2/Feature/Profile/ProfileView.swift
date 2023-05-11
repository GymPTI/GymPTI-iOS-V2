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
            
            Image("\(viewStore.profileImage)")
                .resizable()
                .frame(width: 64, height: 64)
                .clipShape(Circle())
            
            Text("\(viewStore.name)")
                .setFont(20, .semibold)
                .foregroundColor(.white)
            
            Text("\(viewStore.email)")
                .setFont(16, .medium)
                .foregroundColor(.white)
            
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
        .onAppear {
            viewStore.send(.onAppearProfile)
        }
    }
}
