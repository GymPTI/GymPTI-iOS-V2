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
        
        ScrollView(showsIndicators: false) {
            
            VStack {
                CustomNavi("홈", {
                    viewStore.send(.onTapNotificationButton)
                }) {
                    viewStore.send(.onTapSettingButton)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    /// 더미데이터
                    Button {
                        
                    } label: {
                        ZStack(alignment: .top) {
                            
                            Image("무량공처")
                                .resizable()
                                .frame(maxWidth: .infinity)
                                .frame(height: 240)
                            
                            VStack(alignment: .leading, spacing: 2) {
                                
                                Text("처음 시작하는 당신을 위해")
                                    .setFont(14, .medium)
                                    .foregroundColor(Colors.white.color)
                                
                                Text("루틴 관리 200% 활용하는 방법")
                                    .setFont(20, .bold)
                                    .foregroundColor(Colors.white.color)
                            }
                            .padding([.leading, .horizontal], 15)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 70)
                            .background(Colors.darkGray.color.opacity(0.6))
                            
                            Spacer()
                        }
                        .cornerRadius(10)
                    }
                    .buttonStyle(ScaledButtonStyle())
                    
                    Text("요즘 핫한 운동 유튜버")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .padding(.top, 10)
                    
                    InfluencerCardView(rinkURL: "https://www.youtube.com/@ZakTa/featured",
                                       influencerImageURL: "이준명",
                                       influencerProfileURL: "https://yt3.googleusercontent.com/DniZnn6Tt0tUWsSk1jduqkg_YXXr3srHZjes1k0QkFCaHaCrmtWy6LxKTGxmpM-eE1qFbQ90=s176-c-k-c0x00ffffff-no-rj",
                                       title: "맨몸운동 한국 1위, 이준명",
                                       platform: "youtube",
                                       subTitle: "18만 유튜버 이준명 보러가기")
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            Spacer()
            
        }
        .setBackground()
    }
}

struct ScaledButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}
