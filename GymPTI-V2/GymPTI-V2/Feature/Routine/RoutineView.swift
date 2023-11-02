//
//  RoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct RoutineView {
    
    private let store: StoreOf<Routine>
    @ObservedObject var viewStore: ViewStoreOf<Routine>
    
    public init(store: StoreOf<Routine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension RoutineView: View {
    
    public var body: some View {
        
        VStack {
            
            HStack {
                
                Text("루틴")
                    .setFont(34, .semibold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    
                    Button {
                        viewStore.send(.onTapDeleteButton)
                    } label: {
                        Image("trash")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 88)
                    
                    Button {
                        viewStore.send(.onTapAiAddRoutineButton)
                    } label: {
                        Image("ai")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 40)
                    
                    Button {
                        viewStore.send(.onTapAddRoutineButton)
                    } label: {
                        Image("add")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Colors.white.color)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .frame(height: 44)
            .padding(.horizontal, 20)
            .padding(.top, 10)
            
            VStack {
                
                HStack {
                    
                    ForEach([("SUN", "일"), ("MON", "월"),
                             ("THE", "화"),("WEN", "수"),
                             ("THU", "목"),("FRI", "금"),
                             ("SAT", "토")], id: \.0) {
                        day, label in
                        
                        RoutineWeekButton(day, label, selecetDay: viewStore.selectDay) {
                            
                            viewStore.send(.onTapDayButton(day: label))
                            viewStore.send(.getRoutineList(day: viewStore.selectDay))
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .padding(.top, 10)
            }
            
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("\(viewStore.selectDay)요일 루틴")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    
                    if let routineData = viewStore.routineList {
                        
                        if routineData.isEmpty {
                            
                            VStack(alignment: .leading, spacing: 5) {
                                
                                Text("휴식")
                                    .setFont(20, .bold)
                                    .foregroundColor(Colors.white.color)
                                
                                Text("휴식은 운동만큼 중요합니다, 푹 쉬세요!")
                                    .setFont(14, .regular)
                                    .foregroundColor(Colors.white.color)
                                
                            }
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 76)
                            .background(Colors.darkGray.color)
                            .cornerRadius(10)
                        } else {
                            
                            ForEach(routineData) { data in
                                
                                RoutineExcersizeCardView(
                                    data.exerciseName,
                                    targetMuscles: data.targetMuscle.joined(separator: ", "),
                                    reps: data.reps,
                                    sets: data.sets,
                                    restTime: data.restTime,
                                    isCompleted: data.completed,
                                    longPressGestureAction: {
                                        viewStore.send(.onTapRoutineCard(id: data.id, exercise: data.exerciseName))
                                    }) {
                                        viewStore.send(.onTapCompletedButton(id: data.id))
                                    }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
            Spacer()
        }
        .setBackground()
        .onAppear {
            viewStore.send(.getRoutineList(day: getToday()))
        }
    }
}
