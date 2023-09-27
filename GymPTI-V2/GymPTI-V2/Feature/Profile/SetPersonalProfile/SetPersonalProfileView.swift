//
//  SetPersonalProfileView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/24.
//

import SwiftUI
import ComposableArchitecture

public struct SetPersonalProfileView {
    
    private let store: StoreOf<SetPersonalProfile>
    @ObservedObject var viewStore: ViewStoreOf<SetPersonalProfile>
    
    public init(store: StoreOf<SetPersonalProfile>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SetPersonalProfileView: View {
    
    public var body: some View {
        
        VStack(spacing: 0) {
            
            CustomNavigationBar(title: "신체 프로필 정보 수정", leadingButtonAction: {
                viewStore.send(.onTapBackButton)
            }, trailingButtonTitle: "저장") {
                
            }
            
            ScrollView {
                
                
            }
            
        }
        .setBackground()
    }
}
