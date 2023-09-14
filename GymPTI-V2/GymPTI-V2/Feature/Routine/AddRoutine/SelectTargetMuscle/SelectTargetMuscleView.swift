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
            
            VStack(spacing: 15) {
                
                Text("타겟 근육을 선택해주세요!")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach([("CHEST", "가슴"),
                             ("BACK", "등"),
                             ("LEGS", "하체"),
                             ("SHOULDER", "어깨"),
                             ("ARM", "팔")],
                            id: \.0) { (eng, kor) in
                        
                        Spacer()
                        
                        RoutineTargetMuscle(eng, kor, selectMuscle: viewStore.selectMuscle) {
                            
                            viewStore.send(.onSelectMuscleButton(muscle: eng))
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
                
                if viewStore.isSelectedMuscle {
                    
                    Text("운동을 선택해주세요!")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack {
                            
                            ForEach([
                                ("CHEST", ChestMuscleExercise.allCases.map { $0.rawValue }),
                                ("BACK", BackMuscleExercise.allCases.map { $0.rawValue }),
                                ("LEGS", LegsMuscleExercise.allCases.map { $0.rawValue }),
                                ("SHOULDER", ShoulderMuscleExercise.allCases.map { $0.rawValue }),
                                ("ARM", ArmMuscleExercise.allCases.map { $0.rawValue }),
                                ("Abs", AbsExercise.allCases.map { $0.rawValue })
                            ], id: \.0) { group, exercises in
                                if viewStore.selectMuscle == group {
                                    ForEach(exercises, id: \.self) { exercise in
                                        Button(action: {
                                            print(exercise)
                                        }) {
                                            Text(exercise)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            
            CustomButton("다음", disabled: !viewStore.isSelectedExercize) {
                viewStore.send(.onTapNextButton)
            }
            .padding(.top, 80)
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}
