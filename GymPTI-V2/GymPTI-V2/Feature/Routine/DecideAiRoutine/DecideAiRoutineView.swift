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
                    
                    if let routineData = viewStore.routineList?.result {
                        
                        Text("루틴이 마음에 드시나요?")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        ForEach(routineData, id: \.self) { data in
                            
                            RoutineExcersizeCardView(
                                data.exerciseName, 
                                targetMuscles: "",
                                reps: Int(data.reps) ?? 0,
                                sets: Int(data.sets) ?? 0,
                                restTime: Int(data.restTime) ?? 0,
                                isCompleted: nil)
                        }
                        
                        HStack(spacing: 15) {
                            CustomButton("결정", disabled: false) {
                                viewStore.send(.onTapDecideButton)
                            }
                            
                            CustomButton("재생성", disabled: false) {
                                viewStore.send(.onTapDecideButton)
                            }
                            .opacity(0.3)
                        }
                        .padding(.top, 40)
                        .padding(.horizontal, 60)
                    }
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
        .overlay {
            if viewStore.isCreateAiRoutine {
                LoadingView(loadingType: .createAiRotine)
            }
        }
    }
}
