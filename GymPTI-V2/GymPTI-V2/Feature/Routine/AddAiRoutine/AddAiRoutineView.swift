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
                
                VStack(spacing: 10) {
                    
                    Text("타겟 근육을 선택해주세요 (최대 3개)")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach([("CHEST", "가슴"),
                                     ("BACK", "등"),
                                     ("LEGS", "하체"),
                                     ("SHOULDER", "어깨"),
                                     ("ARM", "팔"),
                                     ("ABS", "복근"),],
                                    id: \.0) { (tag, muscle) in
                                
                                Button {
                                    viewStore.send(.onSelectMuscleButton(tag))
                                    print(viewStore.selectMuscle)
                                } label: {
                                    Text("\(muscle)")
                                        .setFont(16, .bold)
                                        .foregroundColor(Colors.white.color)
                                        .padding(15)
                                        .background(
                                            Rectangle()
                                                .frame(minWidth: 0, maxWidth: 200)
                                                .frame(height: 34)
                                                .cornerRadius(15)
                                        )
                                }
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Colors.darkGray.color)
                    .cornerRadius(10)
                    
                    if viewStore.isSelectMuscle {
                        
                        Text("이런 운동은 어때요?")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        .setBackground()
    }
}
