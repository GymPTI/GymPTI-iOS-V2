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
        
        ScrollView(showsIndicators: false) {
            
            VStack {
                
                CustomNavi("프로필", {
                    viewStore.send(.onTapNotificationButton)
                }) {
                    viewStore.send(.onTapSettingButton)
                }
                
                if let userData = viewStore.user {
                    
                    VStack(spacing: 0) {
                        
                        ZStack(alignment: .bottom) {
                            
                            if let image = userData.profileImage {
                                AsyncImage(url: URL(string: image)) { image in
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
                            } else {
                                Image(userData.nickname == "뉴진스" ? "Newjeans" : "user")
                                    .resizable()
                                    .frame(width: 108, height: 108)
                                    .clipShape(Circle())
                                    .overlay(RoundedRectangle(cornerRadius: 108)
                                        .strokeBorder(Colors.white.color, lineWidth: 2))
                            }
                        }
                        
                        Text("\(userData.nickname ?? "")")
                            .setFont(24, .bold)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                        
                        Text("@\(userData.userId ?? "")")
                            .setFont(10, .regular)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 2)
                        
                        HStack(spacing: 10) {
                            
                            Button {
                                viewStore.send(.onTapEditInfoButton)
                            } label: {
                                Text("프로필 정보 수정")
                                    .setFont(14, .medium)
                                    .foregroundColor(Colors.white.color)
                                    .frame(height: 30)
                                    .frame(maxWidth: .infinity)
                                    .background(Colors.darkGray.color)
                                    .cornerRadius(10)
                            }
                            
                            Button {
                                viewStore.send(.onTapSetPersonalProfileButton)
                            } label: {
                                Text("신체 프로필 설정")
                                    .setFont(14, .medium)
                                    .foregroundColor(Colors.white.color)
                                    .frame(height: 30)
                                    .frame(maxWidth: .infinity)
                                    .background(Colors.darkGray.color)
                                    .cornerRadius(10)
                            }
                        }
                        .padding(.top, 20)
                        
                        Text("추후 업데이트를 통해 기능이 추가될 예정이에요!")
                            .setFont(14, .medium)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 40)
                        
                        Button {
                            print(viewStore.user!)
                        } label: {
                            Text("test")
                        }
                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                }
            }
            Spacer()
        }
        .setBackground()
        .task {
            viewStore.send(.onAppearProfile)
        }
    }
}
