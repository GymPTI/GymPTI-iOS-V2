//
//  DecideAiRoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 10/25/23.
//

import SwiftUI
import ComposableArchitecture

public struct DecideAiRoutineView {
    
    @State private var isTapButton: Bool = false
    
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
                            
                            VStack(alignment: .leading, spacing: 6) {
                                
                                Text("\(exerciseNameToKor(data.exerciseName))")
                                    .setFont(20, .bold)
                                    .foregroundColor(Colors.white.color)
                                
                                HStack {
                                    Image("timer")
                                    
                                    Text("\(data.reps)회 • \(data.sets)세트")
                                        .setFont(14, .regular)
                                        .foregroundColor(Colors.white.color)
                                        .frame(width: 80, alignment: .leading)
                                    
                                    Image("rest")
                                        .padding(.leading, 4)
                                    
                                    Text("각 세트 후 \(Text("\(data.restTime)").bold()) 초 휴식")
                                        .setFont(14, .regular)
                                        .foregroundColor(Colors.white.color)
                                }
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(.vertical, 15)
                            .padding(.horizontal, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 74)
                            .background(Colors.darkGray.color)
                            .cornerRadius(10)
                        }
                        
                        CustomButton("결정", disabled: false) {
                            isTapButton = true
                        }
                        .padding(.top, 40)
                        .padding(.horizontal, 100)
                        
                        HStack(spacing: 2) {
                            Text("루틴이 마음에 드시지 않으신가요?")
                                .setFont(14, .regular)
                                .foregroundColor(Colors.white.color)
                            
                            Button {
                                viewStore.send(.onTapRecreateButton)
                            } label: {
                                Text("루틴 재생성 하기")
                                    .setFont(14, .bold)
                                    .foregroundColor(Colors.main.color)
                            }
                        }
                        .frame(maxWidth: .infinity)
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
        .sheet(isPresented: $isTapButton, onDismiss: {
            isTapButton = false
        }) {
            VStack(alignment: .center) {
                CustomNavigationBar(title: "ai 루틴 추가하기") {
                    viewStore.send(.onTapBackButton)
                }
                
                VStack(spacing: 10) {
                    Text("추가할 요일을 선택해주세요")
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
                
                CustomButton("추가", disabled: false) {
                    viewStore.send(.onTapDecideButton)
                }
                .padding(.top, 40)
                .padding(.horizontal, 100)
                
                Spacer()
            }
            .padding(.top, 10)
            .setBackground()
        }
    }
}
