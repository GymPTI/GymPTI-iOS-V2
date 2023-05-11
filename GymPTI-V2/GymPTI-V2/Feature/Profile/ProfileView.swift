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
            
            ZStack(alignment: .bottom) {
                Image("\(viewStore.profileImage)")
                    .resizable()
                    .frame(width: 108, height: 108)
                    .clipShape(Circle())
                
                Button(action: {
                    print("프로필 사진 변경")
                }) {
                    Image("Edit")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                .frame(width: 42, height: 42)
                .background(Color.accentColor)
                .cornerRadius(28)
                .overlay(RoundedRectangle(cornerRadius: 28)
                    .strokeBorder(Color("BackgroundColor"), lineWidth: 6))
                .padding(.bottom, -20)
            }
            .padding(.bottom, 20)
            
            VStack(spacing: 15) {
                
                Text("이민규\(viewStore.name)")
                    .setFont(22, .semibold)
                    .foregroundColor(.white)
                
                Text("\"내 꿈이 누군가의 꿈이 되는 삶\"")
                    .setFont(16, .medium)
                    .foregroundColor(.white)
            }
            
            AuthButton("정보 수정하기", disabled: false) {
                viewStore.send(.onTapEditInfoButton)
            }
            
            AuthButton("계정 수정하기", disabled: false) {
                viewStore.send(.onTapEditAccountButton)
            }

            
            AuthButton("설정하기", disabled: false) {
                viewStore.send(.onTapSettingButton)
            }
            
            Spacer()

        }
        .padding(.horizontal, 20)
        .setBackground()
        .onAppear {
//            viewStore.send(.onAppearProfile)
        }
    }
}
