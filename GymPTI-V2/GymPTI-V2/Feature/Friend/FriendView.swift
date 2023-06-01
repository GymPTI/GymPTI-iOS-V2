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
        
        VStack {
            
            CustomNavi("친구", {
                viewStore.send(.onTapNotificationButton)
            }) {
                viewStore.send(.onTapSettingButton)
            }
            
            ScrollView {
                
                HStack(spacing: 10) {
                    
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(Colors.gray.color)
                        .padding(.leading, 20)
                    
                    Text("친구의 ID를 검색해보세요")
                        .setFont(14, .light)
                        .foregroundColor(Colors.gray.color)
                    
                    Spacer()
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
                
                VStack(spacing: 10) {
                    
                    Text("당신의 친구 • \(viewStore.cellCnt)명")
                        .setFont(14, .medium)
                        .foregroundColor(Colors.main.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 10)
                    
                    ForEach(0 ..< viewStore.cellCnt, id: \.self) { cnt in
                        FriendCellView(name: "\(cnt + 1)번째친구", id: "myfriend\(cnt + 1)")
                    }
                }
                .padding(.top, 10)
            }
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
    }
}
