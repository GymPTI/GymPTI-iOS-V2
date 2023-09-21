//
//  ProfileView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct ProfileView {
    
    private let store: StoreOf<Profile>
    @ObservedObject var viewStore: ViewStoreOf<Profile>
    
    public init(store: StoreOf<Profile>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension ProfileView: View {
    
    public var body: some View {
        
        ZStack {
            
            VStack {
                
                CustomNavi("프로필", {
                    viewStore.send(.onTapNotificationButton)
                }) {
                    viewStore.send(.onTapSettingButton)
                }
                .padding(.horizontal, 20)
                
                ScrollView {
                    
                    if let userData = viewStore.user {
                        
                        VStack(spacing: 0) {
                            
                            ZStack(alignment: .bottom) {
                                if userData.nickname == "뉴진스" {
                                    Image("Newjeans")
                                        .resizable()
                                        .frame(width: 108, height: 108)
                                        .clipShape(Circle())
                                        .overlay(RoundedRectangle(cornerRadius: 108)
                                            .strokeBorder(Colors.white.color, lineWidth: 2))
                                } else {
                                    
                                    AsyncImage(url: URL(string: userData.profileImage!)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 108, height: 108)
                                            .clipShape(Circle())
                                            .overlay(RoundedRectangle(cornerRadius: 108)
                                                .strokeBorder(Colors.white.color, lineWidth: 2))
                                    } placeholder: {
                                        Image("user")
                                            .resizable()
                                            .frame(width: 108, height: 108)
                                            .clipShape(Circle())
                                            .overlay(RoundedRectangle(cornerRadius: 108)
                                                .strokeBorder(Colors.white.color, lineWidth: 2))
                                    }
                                }
                            }
                            
                            Text("\(userData.nickname!)")
                                .setFont(24, .bold)
                                .foregroundColor(Colors.white.color)
                                .padding(.top, 10)
                            
                            Text("@\(userData.userId!)")
                                .setFont(10, .light)
                                .foregroundColor(Colors.white.color)
                                .padding(.top, 10)
                            
                            Text("\(userData.statusMessage!)")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                                .padding(.top, 10)
                            
                            Button {
                                viewStore.send(.onTapEditInfoButton)
                            } label: {
                                Text("프로필 정보 수정")
                                    .setFont(14, .medium)
                                    .foregroundColor(Colors.white.color)
                                    .frame(height: 40)
                                    .frame(maxWidth: .infinity)
                                    .background(Colors.darkGray.color)
                                    .cornerRadius(10)
                            }
                            .padding([.horizontal, .top], 20)
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
        .setBackground()
        .task {
            viewStore.send(.onAppearProfile)
        }
    }
}
