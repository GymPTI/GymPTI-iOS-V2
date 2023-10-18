//
//  SetRoutine.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/21.
//

import SwiftUI
import ComposableArchitecture

public struct SetRoutineView {
    
    private let store: StoreOf<SetRoutine>
    @ObservedObject var viewStore: ViewStoreOf<SetRoutine>
    
    public init(store: StoreOf<SetRoutine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SetRoutineView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavigationBar(title: "루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            ScrollView {
                
                VStack(spacing: 10) {
                    
                    Text("요일을 선택해주세요")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack {
                        
                        ForEach([("SUN", "일"), ("MON", "월"),
                                 ("THE", "화"), ("WEN", "수"),
                                 ("THU", "목"), ("FRI", "금"),
                                 ("SAT", "토")], id: \.0) { day, label in
                            
                            RoutineWeekButton(day, label, selecetDay: viewStore.selectedDay) {
                                
                                viewStore.send(.onSelectDayButton(day: label))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Colors.darkGray.color)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                
                if viewStore.isSelectedDay {
                    
                    VStack(spacing: 10) {
                        
                        Text("타겟 근육을 선택해주세요")
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
                                    
                                    RoutineTargetMuscle(tag, muscle, selectMuscle: viewStore.selectMuscle) {
                                        viewStore.send(.onSelectMuscleButton(muscle: tag))
                                    }
                                }
                            }
                            .padding(.horizontal, 15)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Colors.darkGray.color)
                        .cornerRadius(10)
                    }
                    .padding([.top, .horizontal], 20)
                }
                
                if viewStore.isSelectedMuscle {
                    
                    VStack(spacing: 10) {
                        
                        Text("운동을 선택해주세요")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                ForEach(exercises(forMuscle: viewStore.selectMuscle), id: \.self) { exercise in
                                    
                                    Button(action: {
                                        viewStore.send(.onSelectExerciseButton(exercise: exercise))
                                    }) {
                                        Text(exerciseNameToKor(exercise))
                                            .setFont(16, .bold)
                                            .foregroundColor(Colors.white.color)
                                            .padding(15)
                                            .background(
                                                Rectangle()
                                                    .fill(viewStore.exerciseName == exercise ? Colors.main.color : Colors.darkGray.color)
                                                    .frame(minWidth: 0, maxWidth: 200)
                                                    .frame(height: 34)
                                                    .cornerRadius(15)
                                            )
                                    }
                                    .scaledButtonStyle()
                                }
                            }
                        }
                    }
                    .padding([.horizontal, .top], 20)
                    
                    CustomButton("다음", disabled: !viewStore.isSelectedExercize) {
                        viewStore.send(.onTapNextButton)
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 100)
                }
            }
            Spacer()
        }
        .setBackground()
    }
}
