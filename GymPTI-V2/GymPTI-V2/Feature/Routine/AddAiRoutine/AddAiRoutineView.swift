//
//  AddAiRoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/18/23.
//

import SwiftUI
import ComposableArchitecture

public struct AddAiRoutineView {
    
    private let store: StoreOf<AddAiRoutine>
    @ObservedObject var viewStore: ViewStoreOf<AddAiRoutine>
    
    public init(store: StoreOf<AddAiRoutine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension AddAiRoutineView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavigationBar(title: "ai 루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            ScrollView {
                
                Text("타겟 근육을 선택해주세요!")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .setBackground()
    }
}
