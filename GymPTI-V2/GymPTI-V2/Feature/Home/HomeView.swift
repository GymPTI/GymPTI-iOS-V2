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
                    
                    Text("오늘은 \(getDate())요일 입니다.")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    RoutineExcersizeCardView(
                        "data.exerciseName",
                        targetMuscles: "data.targetMuscle.joined(separator: ",
                        reps: 1,
                        sets: 1,
                        restTime: 1,
                        isCompleted: false,
                        longPressGestureAction: {
                            
                        }) {
                            
                        }
                    
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
                    
                    Text("헬스 뉴스")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .padding(.top, 10)
                    
                    InfluencerCardView(rinkURL: "https://www.youtube.com/@ZakTa/featured",
                                       influencerImageURL: "이준명",
                                       influencerProfileURL: "https://yt3.googleusercontent.com/DniZnn6Tt0tUWsSk1jduqkg_YXXr3srHZjes1k0QkFCaHaCrmtWy6LxKTGxmpM-eE1qFbQ90=s176-c-k-c0x00ffffff-no-rj",
                                       title: "맨몸운동 한국 1위, 이준명",
                                       platform: "youtube",
                                       subTitle: "18만 유튜버 이준명 보러가기")
                    
                    Text("헬스 뉴스")
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
            }
            Spacer()
            
        }
        .setBackground()
    }
}
