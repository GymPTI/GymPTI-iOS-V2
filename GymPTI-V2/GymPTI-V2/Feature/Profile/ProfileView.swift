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
                        
                        Text("\(userData.nickname ?? "")")
                            .setFont(24, .bold)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                        
                        Text("@\(userData.userId ?? "")")
                            .setFont(10, .regular)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 2)
                        
//                        Text("\(userData.statusMessage ?? "")")
//                            .setFont(10, .regular)
//                            .foregroundColor(Colors.white.color)
//                            .padding(.top, 2)
                        
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
                        InfluencerCardView(rinkURL: "https://www.youtube.com/@ZakTa/featured",
                                           influencerImageURL: "이준명",
                                           influencerProfileURL: "https://yt3.googleusercontent.com/DniZnn6Tt0tUWsSk1jduqkg_YXXr3srHZjes1k0QkFCaHaCrmtWy6LxKTGxmpM-eE1qFbQ90=s176-c-k-c0x00ffffff-no-rj",
                                           title: "맨몸운동 한국 1위, 이준명",
                                           platform: "youtube",
                                           subTitle: "18만 유튜버 이준명 보러가기")
                        InfluencerCardView(rinkURL: "https://www.youtube.com/@ZakTa/featured",
                                           influencerImageURL: "이준명",
                                           influencerProfileURL: "https://yt3.googleusercontent.com/DniZnn6Tt0tUWsSk1jduqkg_YXXr3srHZjes1k0QkFCaHaCrmtWy6LxKTGxmpM-eE1qFbQ90=s176-c-k-c0x00ffffff-no-rj",
                                           title: "맨몸운동 한국 1위, 이준명",
                                           platform: "youtube",
                                           subTitle: "18만 유튜버 이준명 보러가기")
                        InfluencerCardView(rinkURL: "https://www.youtube.com/@ZakTa/featured",
                                           influencerImageURL: "이준명",
                                           influencerProfileURL: "https://yt3.googleusercontent.com/DniZnn6Tt0tUWsSk1jduqkg_YXXr3srHZjes1k0QkFCaHaCrmtWy6LxKTGxmpM-eE1qFbQ90=s176-c-k-c0x00ffffff-no-rj",
                                           title: "맨몸운동 한국 1위, 이준명",
                                           platform: "youtube",
                                           subTitle: "18만 유튜버 이준명 보러가기")
                    }
                    .padding([.horizontal, .top], 20)
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
