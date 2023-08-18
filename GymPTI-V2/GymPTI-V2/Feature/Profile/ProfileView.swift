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
        
        VStack {
            
            CustomNavi("프로필", {
                viewStore.send(.onTapNotificationButton)
            }) {
                viewStore.send(.onTapSettingButton)
            }
            
            ScrollView {
                
                VStack(spacing: 0) {
                    
                    ZStack(alignment: .bottom) {
                        
                        KFImage(URL(string: viewStore.profileImage))
                            .placeholder {
                                Image("Profile")
                                    .resizable()
                                    .frame(width: 108, height: 108)
                                    .clipShape(Circle())
                                    .overlay(RoundedRectangle(cornerRadius: 108)
                                        .strokeBorder(Colors.white.color, lineWidth: 2))
                            }
                            .resizable()
                            .frame(width: 108, height: 108)
                            .clipShape(Circle())
                            .overlay(RoundedRectangle(cornerRadius: 108)
                                .strokeBorder(Colors.white.color, lineWidth: 2))
                    }
                    
                    if viewStore.message == "" {
                        
                        Text("이름을 불러오는 중")
                            .setFont(22, .bold)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                            .redacted(reason: .placeholder)
                            .shimmering()

                        Text("id를 불러오는 중")
                            .setFont(10, .light)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                            .redacted(reason: .placeholder)
                            .shimmering()

                        Text("상태 메세지를 불러오는 중")
                            .setFont(14, .medium)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                            .redacted(reason: .placeholder)
                            .shimmering()
                        
                    } else {
                        
                        Text("\(viewStore.name)")
                            .setFont(22, .bold)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                        
                        Text("@\(viewStore.id)")
                            .setFont(10, .light)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                        
                        Text("\(viewStore.message)")
                            .setFont(14, .medium)
                            .foregroundColor(Colors.white.color)
                            .padding(.top, 10)
                    }
                    
                    SettingButton("프로필 정보 수정") {
                        viewStore.send(.onTapEditInfoButton)
                    }
                    .padding(.top, 20)
                }
            }
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
        .onAppear {
            viewStore.send(.onAppearProfile)
        }
    }
}
