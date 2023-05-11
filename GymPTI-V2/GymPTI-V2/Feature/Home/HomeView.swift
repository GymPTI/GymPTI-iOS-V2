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
        viewStore = ViewStore(store)
    }
}

extension HomeView: View {
    
    public var body: some View {
        
        ScrollView {
            
            VStack(spacing: 20) {
                Text("홈 화면")
                    .setFont(28, .semibold)

                Text("오늘의 루틴")
                    .setFont(18, .medium)
                
                ForEach(0 ..< 10) { _ in
                    
                    Button(action: {
                        viewStore.send(.tabButton)
                    }) {
                        HStack {
                            
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(.white)
                    }
                    .padding(.top, 10)
                    
                }
            }
            .padding()
        }
        .setBackground()
    }
}
