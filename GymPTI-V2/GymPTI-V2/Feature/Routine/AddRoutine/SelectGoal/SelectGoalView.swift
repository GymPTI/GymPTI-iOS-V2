//
//  SelectGoalView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/14.
//

import SwiftUI
import ComposableArchitecture

public struct SelectGoalView {
    
    private let store: StoreOf<SelectGoal>
    @ObservedObject var viewStore: ViewStoreOf<SelectGoal>
    
    public init(store: StoreOf<SelectGoal>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SelectGoalView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavigationBar(title: "AI 루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            CustomButton("다음", disabled: false) {
                viewStore.send(.onTapNextButton)
            }
            .padding(.top, 80)
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}