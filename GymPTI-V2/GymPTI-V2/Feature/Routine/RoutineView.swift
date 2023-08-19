//
//  RoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct RoutineView {
    
    private let store: StoreOf<Routine>
    @ObservedObject var viewStore: ViewStoreOf<Routine>
    
    public init(store: StoreOf<Routine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension RoutineView: View {
    
    public var body: some View {
        
        VStack {
            
            CustomNavi("루틴", {
                viewStore.send(.onTapNotificationButton)
            }) {
                viewStore.send(.onTapSettingButton)
            }
            
            ScrollView {
                
                Button(action: {
                    
                })  {
                    Text("루틴")
                }
                
                Spacer()
            }
            .padding(.top, 20)
        }
        .padding([.top,.horizontal], 20)
        .setBackground()
    }
}
