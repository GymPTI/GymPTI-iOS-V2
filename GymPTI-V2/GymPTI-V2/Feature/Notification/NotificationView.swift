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
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension NotificationView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
                    Image("Back")
                        .resizable()
                        .frame(width: 10, height: 18)
                }
                .frame(width: 32, height: 24)
                
                Spacer()
                
                Text("알림")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                }
                .frame(width: 32, height: 24)
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
            .padding(.top, 20)
        }
        .padding([.top, .horizontal], 20)
        .setBackground()
    }
}
