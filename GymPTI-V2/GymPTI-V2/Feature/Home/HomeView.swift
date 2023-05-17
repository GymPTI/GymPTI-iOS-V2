//
//  HomeView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import ComposableArchitecture
import CardStack

public struct HomeView {
    
    private let store: StoreOf<Home>
    @ObservedObject var viewStore: ViewStoreOf<Home>
    
    public init(store: StoreOf<Home>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension HomeView: View {
    
    public var body: some View {
        
        ScrollView {
            
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
                }
                
                Text("홈")
                    .setFont(38, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    
                    Button(action: {
                        viewStore.send(.onTapTipButton)
                    })  {
                        Text("오늘의 운동 팁!")
                    }
                }
                
                Spacer()
            }
            
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
    }
}
