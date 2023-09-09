//
//  HomeView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture

public struct HomeView {
    
    private let store: StoreOf<Home>
    @ObservedObject var viewStore: ViewStoreOf<Home>
    
    public init(store: StoreOf<Home>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension HomeView: View {
    
    public var body: some View {
        
        VStack {
            
            CustomNavi("홈", {
                viewStore.send(.onTapNotificationButton)
            }) {
                viewStore.send(.onTapSettingButton)
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            HomeScrollView(viewStore: viewStore)
            
        }
        .padding(.top, 20)
        .setBackground()
    }
}

extension HomeView {
    
    struct HomeScrollView: View {
        
        let viewStore: ViewStoreOf<Home>
        
        init(viewStore: ViewStoreOf<Home>) {
            self.viewStore = viewStore
        }
        
        var body: some View {
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("요즘 핫한 운동 유튜버🔥")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    Button {
                        
                        if let youtubeURL = URL(string: "https://www.youtube.com/@ZakTa/featured") {
                                        
                                        UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
                                    }
                    } label : {
                        
                        VStack(spacing: 0) {
                            
                            Image("이준명")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 206)
                            
                            HStack(spacing: 10) {
                                
                                AsyncImage(url: URL(string: "https://yt3.googleusercontent.com/DniZnn6Tt0tUWsSk1jduqkg_YXXr3srHZjes1k0QkFCaHaCrmtWy6LxKTGxmpM-eE1qFbQ90=s176-c-k-c0x00ffffff-no-rj")) { image in
                                    image
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                } placeholder: {
                                    Image("user")
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .cornerRadius(10)
                                }
                                .padding(.leading, 15)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    
                                    Text("맨몸운동 한국 1위, \"이준명\"")
                                        .setFont(20, .bold)
                                        .foregroundColor(Colors.white.color)
                                    
                                    HStack(spacing: 4) {
                                        
                                        Image("youtube")
                                            .resizable()
                                            .frame(width: 12, height: 12)
                                        
                                        Text("18만 유튜버 이준명 보러가기")
                                            .setFont(12, .medium)
                                            .padding(.top, 4)
                                            .foregroundColor(Colors.white.color)
                                    }
                                }
                                
                                Spacer()
                            }
                            .padding(.top, 15)
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 296)
                        .background(Colors.darkGray.color)
                        .cornerRadius(10)
                    }
                }
                .padding([.top, .horizontal], 20)
            }
        }
    }
}

