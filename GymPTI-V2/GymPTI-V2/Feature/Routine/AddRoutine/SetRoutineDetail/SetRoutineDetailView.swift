//
//  SetRoutineDetailView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

public struct SetRoutineDetailView {
    
    private let store: StoreOf<SetRoutineDetail>
    @ObservedObject var viewStore: ViewStoreOf<SetRoutineDetail>
    
    public init(store: StoreOf<SetRoutineDetail>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SetRoutineDetailView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            HStack {
                
                Button {
                    viewStore.send(.onTapBackButton)
                } label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 9, height: 15)
                }
                .frame(width: 42, height: 36)
                .padding(.bottom, 6)
                
                Spacer()
                
                Text("루틴 추가하기")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .padding(.bottom, 6)
                    .padding(.trailing, 42)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            
            VStack {
                
                Text("운동 상세 설정")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)
            
            CustomButton("추가", disabled: false) {
                viewStore.send(.onTapAddButton)
            }
            .padding(.top, 80)
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}
