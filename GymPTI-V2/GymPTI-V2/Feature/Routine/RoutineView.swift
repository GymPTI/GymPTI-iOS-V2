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
            .padding(.horizontal, 20)
            
            ScrollView(showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("\(getDate())")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    HStack {
                        
                        ForEach([("SUN", "일"), ("MON", "월"),
                                 ("THE", "화"),("WEN", "수"),
                                 ("THU", "목"),("FRI", "금"),
                                 ("SAT", "토")], id: \.0) {
                            day, label in
                            
                            Spacer()
                            
                            RoutineWeekButton(day, label) {
                                
                                switch label {
                                    
                                case "일":
                                    viewStore.send(.onTapSunButton)
                                case "월":
                                    viewStore.send(.onTapMonButton)
                                case "화":
                                    viewStore.send(.onTapTheButton)
                                case "수":
                                    viewStore.send(.onTapWenButton)
                                case "목":
                                    viewStore.send(.onTapThuButton)
                                case "금":
                                    viewStore.send(.onTapFriButton)
                                case "토":
                                    viewStore.send(.onTapSatButton)
                                    
                                default:
                                    viewStore.send(.onTapSunButton)
                                }
                                
                                print(viewStore.routineList ?? "")
                                viewStore.send(.onSelectDay)
                            }
                            .padding(.bottom, 8)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Colors.darkGray.color)
                    .cornerRadius(10)
                    
                    Text("\(viewStore.selectDay)요일 루틴")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .padding(.top, 10)
                    
                    if let routineData = viewStore.routineList {
                        
                        if routineData.isEmpty {
                            
                            VStack(alignment: .leading, spacing: 4) {
                                
                                Text("휴식")
                                    .setFont(20, .bold)
                                    .foregroundColor(Colors.white.color)
                                
                                Text("휴식은 운동 만큼 중요합니다, 푹 쉬세요!")
                                    .setFont(14, .regular)
                                    .foregroundColor(Colors.white.color)
                                
                            }
                            .padding(.leading, 20)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 80)
                            .background(Colors.darkGray.color)
                            .cornerRadius(10)
                        } else {
                            
                            ForEach(routineData) { data in
                                RoutineExcersizeCell(
                                    data.exerciseName,
                                    targetMuscles: data.targetMuscle.joined(separator: ", "),
                                    reps: data.reps,
                                    sets: data.sets,
                                    restTime: "\(data.restTime)회"
                                ) {
                                    viewStore.send(.onTapRoutineCell(id: data.id))
                                }
                                .padding(.bottom, 10)
                            }
                            
                        }
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .padding(.top, 20)
        .setBackground()
        .task {
            viewStore.send(.onAppearRoutineView)
        }
    }
}
