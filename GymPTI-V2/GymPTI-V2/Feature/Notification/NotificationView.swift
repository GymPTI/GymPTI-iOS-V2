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
            
            CustomNavigationBar(title: "알람") {
                viewStore.send(.onTapBackButton)
            }
            
            ScrollView {
                
                Text("알람")
                    .padding(.top, 40)
                    .frame(maxWidth: .infinity)
            }
        }
        .setBackground()
    }
}
