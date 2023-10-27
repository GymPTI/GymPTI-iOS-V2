//
//  DecideAiRoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/25/23.
//

import SwiftUI
import ComposableArchitecture

public struct DecideAiRoutineView {
    
    private let store: StoreOf<DecideAiRoutine>
    @ObservedObject var viewStore: ViewStoreOf<DecideAiRoutine>
    
    public init(store: StoreOf<DecideAiRoutine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension DecideAiRoutineView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavigationBar(title: "ai 루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    
                    if let routineData = viewStore.routineList {
                        
//                        ForEach(routineData, id: \.self) { data in
//                            
//                            RoutineExcersizeCardView(
//                                data.exercisename,
//                                targetMuscles: "",
//                                reps: Int(data.reps)!,
//                                sets: Int(data.sets)!,
//                                restTime: Int(data.resttime)!,
//                                isCompleted: nil)
//                        }
                    } else {
                        Text("운동 루틴을 생성하고 있습니다...")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        Text("\(viewStore.selectMuscle) 근육")
                    }
                    
                    CustomButton("결정", disabled: false) {
                        viewStore.send(.onTapDecideButton)
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 100)
                }
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)
        }
        .setBackground()
        .onAppear {
            viewStore.send(.getAiRoutineList)
        }
    }
}
