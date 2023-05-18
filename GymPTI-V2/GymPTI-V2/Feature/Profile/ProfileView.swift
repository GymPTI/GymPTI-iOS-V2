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
            
            ZStack {
                
                Button(action: {
                    print("띵~~")
                }) {
                    Image("bell")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 40)
                
                Button(action: {
                    viewStore.send(.onTapSettingButton)
                }) {
                    Image("setting")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(Colors.white.color)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            ScrollView {
                
                Text("프로필")
                    .setFont(38, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 0) {
                    
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
                    
                    Text("\(viewStore.name)")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .padding(.top, 10)
                    
                    Text("@\(viewStore.id)")
                        .setFont(14, .light)
                        .foregroundColor(Colors.white.color)
                    
                    if !(viewStore.message == "") {
                        
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
                
                Spacer()
            }
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
        .onAppear {
            viewStore.send(.onAppearProfile)
        }
        .refreshable {
            viewStore.send(.onAppearProfile)
        }
    }
}
