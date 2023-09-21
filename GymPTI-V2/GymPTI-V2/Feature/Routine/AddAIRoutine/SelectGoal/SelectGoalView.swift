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
            
            VStack {
                
                Text("당신이 목표하는 몸이 있나요?")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)
            
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
