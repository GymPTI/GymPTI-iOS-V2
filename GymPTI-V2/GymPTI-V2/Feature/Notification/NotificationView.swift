//
//  NotificationView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/31.
//

import SwiftUI
import ComposableArchitecture

public struct NotificationView {
    
    private let store: StoreOf<Notification>
    @ObservedObject var viewStore: ViewStoreOf<Notification>
    
    public init(store: StoreOf<Notification>) {
        self.store = store
        viewStore = ViewStore(store)
    }
}

extension NotificationView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            VStack {
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 10, height: 18)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("알림")
                    .setFont(38, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("알림")
                        .setFont(18, .medium)
                        .foregroundColor(Colors.main.color)
                }
                .padding(.top, 20)
                
                Spacer()
            }
        }
        .padding([.top, .horizontal], 20)
        .setBackground()
    }
}
