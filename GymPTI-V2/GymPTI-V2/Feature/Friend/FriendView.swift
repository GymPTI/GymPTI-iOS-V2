//
//  FriendView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import ComposableArchitecture

public struct FriendView {
    
    private let store: StoreOf<Friend>
    @ObservedObject var viewStore: ViewStoreOf<Friend>
    
    public init(store: StoreOf<Friend>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension FriendView: View {
    
    public var body: some View {
        
        ScrollView {
            
            VStack(spacing: 10) {
                
                Button(action: {
                    
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Colors.white.color)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text("친구")
                    .setFont(34, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("친구 추가 요청")
                    .setFont(18, .medium)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                
                VStack {
                    
                    HStack(alignment: .center, spacing: 6) {
                        
                        Image("Profile")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .padding(.leading, 20)
                        
                        VStack(alignment: .leading) {
                            
                            Text("푸쉬업1000개")
                                .setFont(16, .semibold)
                                .foregroundColor(Colors.white.color)
                            
                            Text("nowTryPushUp1000")
                                .setFont(10, .light)
                                .foregroundColor(Colors.gray.color)
                        }
                        .padding(.leading, 4)
                        
                        Spacer()
                        
                        Button(action: {
                            viewStore.send(.tabButton2)
                        }) {
                            Text("요청 삭제")
                                .setFont(12, .semibold)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 64, height: 22)
                                .background(Colors.darkGray.color)
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            viewStore.send(.tabButton1)
                        }) {
                            Text("요청 수락")
                                .setFont(12, .semibold)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 64, height: 22)
                                .background(Colors.main.color)
                                .cornerRadius(10)
                        }
                        .padding(.trailing, 20)
                    }
                    .frame(height: 64)
                    .frame(maxWidth: .infinity)
                    .background(Colors.darkGray.color)
                    .cornerRadius(10)
                }
                
                Text("친구 목록")
                    .setFont(18, .medium)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .top], 10)
                
                ForEach(0 ..< viewStore.cellCnt, id: \.self) { cnt in
                    FriendCellView(name: "\(cnt + 1)번째친구", id: "myfriend\(cnt + 1)") {
                        print("\(cnt + 1)")
                    }
                }

            }
        }
        .padding()
        .setBackground()
    }
}
