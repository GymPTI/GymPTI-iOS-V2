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
                        .frame(width: 9, height: 15)
                }
                .frame(width: 42, height: 36)
                .padding(.bottom, 6)
                
                Spacer()
                
                Text("알람")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .padding(.bottom, 6)
                    .padding(.trailing, 42)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(Colors.darkGray.color)
            
            ScrollView {
                
                Text("알람")
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity)
            }
        }
        .setBackground()
    }
}
