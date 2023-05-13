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
                        .frame(width: 26, height: 26)
                        .foregroundColor(Colors.white.color)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            
            ZStack(alignment: .bottom) {
                
                KFImage(URL(string: viewStore.profileImage))
                    .placeholder {
                        Image("Profile")
                            .resizable()
                            .frame(width: 86, height: 86)
                            .clipShape(Circle())
                    }
                    .resizable()
                    .frame(width: 108, height: 108)
                    .clipShape(Circle())
            }
            .padding(.bottom, 10)
            
            VStack(spacing: 10) {
                
                //                Text("\(viewStore.name)")
                Text("대소고이민규")
                    .setFont(18, .bold)
                    .foregroundColor(Colors.white.color)
                
                //                Text("\"\(viewStore.message)\"")
                Text("\"내 꿈이 누군가의 꿈이 되는 삶.\"")
                    .setFont(14, .medium)
                    .foregroundColor(Colors.white.color)
            }
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapEditInfoButton)
                }) {
                    Text("프로필 수정")
                        .setFont(14, .medium)
                        .foregroundColor(Colors.white.color)
                        .frame(height: 34)
                        .frame(maxWidth: .infinity)
                        .background(Colors.darkGray.color)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    viewStore.send(.onTapEditAccountButton)
                }) {
                    Text("계정 정보 수정")
                        .setFont(14, .medium)
                        .foregroundColor(Colors.white.color)
                        .frame(height: 34)
                        .frame(maxWidth: .infinity)
                        .background(Colors.darkGray.color)
                        .cornerRadius(10)
                }
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .setBackground()
        .onAppear {
            viewStore.send(.onAppearProfile)
        }
    }
}
