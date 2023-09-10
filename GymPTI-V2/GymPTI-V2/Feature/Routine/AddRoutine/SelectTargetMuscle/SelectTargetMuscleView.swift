//
//  SelectTargetMuscleView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/04.
//

import SwiftUI
import ComposableArchitecture

public struct SelectTargetMuscleView {
    
    private let store: StoreOf<SelectTargetMuscle>
    @ObservedObject var viewStore: ViewStoreOf<SelectTargetMuscle>
    
    public init(store: StoreOf<SelectTargetMuscle>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SelectTargetMuscleView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavigationBar(title: "루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            VStack {
                
                Text("운동 종류 선택")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach([("CHEST", "가슴"), ("BACK", "등"),
                         ("LEGS", "하체"), ("SHLDR", "어깨"), (
                            "ARM", "팔")], id: \.0) { (eng, kor) in
                        
                        Spacer()
                        
                        Button {
                            viewStore.send(.onSelectExerciseButton(exercise: eng))
                        } label: {
                            
                            VStack(spacing: 10) {
                                
                                Text("\(eng)")
                                    .setFont(14, .regular)
                                    .foregroundColor(Colors.white.color)
                                
                                Text("\(kor)")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .background(
                                        Rectangle()
                                            .fill(Colors.black.color)
                                            .frame(width: 58, height: 34)
                                            .cornerRadius(15)
                                    )
                            }
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            CustomButton("다음", disabled: !viewStore.isSelected) {
                viewStore.send(.onTapNextButton)
            }
            .padding(.top, 80)
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}
