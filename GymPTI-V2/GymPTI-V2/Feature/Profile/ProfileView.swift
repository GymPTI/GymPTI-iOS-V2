//
//  ProfileView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture
import Kingfisher

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
                
                KFImage(URL(string: viewStore.profileImage))
                    .placeholder {
                        Image("Profile")
                            .resizable()
                            .frame(width: 108, height: 108)
                            .clipShape(Circle())
                    }
                    .resizable()
                    .frame(width: 108, height: 108)
                    .clipShape(Circle())
            }
            .padding(.bottom, 20)
            
            VStack(spacing: 10) {
                
                Text("\(viewStore.name)")
                    .setFont(22, .semibold)
                    .foregroundColor(.white)
                
                Text("\"\(viewStore.email)\"")
                    .setFont(16, .medium)
                    .foregroundColor(.white)
                
                Text("\"\(viewStore.message)\"")
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
            viewStore.send(.onAppearProfile)
        }
    }
}
