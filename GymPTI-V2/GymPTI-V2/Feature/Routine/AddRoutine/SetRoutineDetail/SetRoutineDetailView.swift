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
            
            CustomNavigationBar(title: "루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            ScrollView {
                
                VStack {
                    
                    Text("운동의 상세한 설정을 해주세요!")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(spacing: 10) {
                        
                        HStack(spacing: 10) {
                            
                            Image("timer")
                                .padding(.leading, 15)
                            
                            Text("반복 횟수")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 60, alignment: .leading)
                            
                            Text(String(viewStore.reps))
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                                .frame(minWidth: 0, maxWidth: 50)
                                .frame(height: 46)
                                .background(Colors.gray.color)
                                .cornerRadius(15)
                            
                            Text("회")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                            
                            Spacer()
                            
                            HStack {
                                
                                Button {
                                    viewStore.send(.onTapMinusRepsButton)
                                } label: {
                                    Image("minus")
                                        .frame(width: 20, height: 46)
                                }
                                
                                Rectangle()
                                    .frame(width: 2, height: 36)
                                    .foregroundColor(Colors.darkGray.color)
                                    .cornerRadius(1)
                                
                                Button {
                                    viewStore.send(.onTapPlusRepsButton)
                                } label: {
                                    Image("plus")
                                        .frame(width: 20, height: 46)
                                }
                                
                            }
                            .frame(width: 80, height: 46)
                            .background(Colors.gray.color)
                            .cornerRadius(15)
                            .padding(.trailing, 15)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Colors.darkGray.color)
                        .cornerRadius(10)
                        
                        HStack(spacing: 10) {
                            
                            Image("timer")
                                .padding(.leading, 15)
                            
                            Text("세트 수")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 60, alignment: .leading)
                            
                            Text("\(viewStore.sets)")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                                .frame(minWidth: 0, maxWidth: 50)
                                .frame(height: 46)
                                .background(Colors.gray.color)
                                .cornerRadius(15)
                            
                            Text("회")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                            
                            Spacer()
                            
                            HStack {
                                
                                Button {
                                    viewStore.send(.onTapMinusSetsButton)
                                } label: {
                                    Image("minus")
                                        .frame(width: 20, height: 46)
                                }
                                
                                Rectangle()
                                    .frame(width: 2, height: 36)
                                    .foregroundColor(Colors.darkGray.color)
                                    .cornerRadius(1)
                                
                                Button {
                                    viewStore.send(.onTapPlusSetsButton)
                                } label: {
                                    Image("plus")
                                        .frame(width: 20, height: 46)
                                }
                            }
                            .frame(width: 80, height: 46)
                            .background(Colors.gray.color)
                            .cornerRadius(15)
                            .padding(.trailing, 15)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Colors.darkGray.color)
                        .cornerRadius(10)
                        
                        HStack(spacing: 10) {
                            
                            Image("rest")
                                .frame(width: 20, height: 20)
                                .padding(.leading, 15)
                            
                            Text("휴식 시간")
                                .setFont(14, .medium)
                                .foregroundColor(Colors.white.color)
                                .frame(width: 60, alignment: .leading)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 0) {
                                    
                                    ForEach([15, 30, 45, 60, 75, 90, 120],
                                            id: \.self) { time in
                                        
                                        Button {
                                            viewStore.send(.onSelectRestTimeButton(time: time))
                                        } label: {
                                            Text("\(secondsToMinutesAndSeconds(seconds: time))")
                                                .setFont(14, .medium)
                                                .foregroundColor(Colors.white.color)
                                                .padding(15)
                                                .background(
                                                    viewStore.restTime == time ?
                                                    Rectangle()
                                                        .fill(Colors.main.color)
                                                        .frame(minWidth: 0, maxWidth: 200)
                                                        .frame(height: 34)
                                                        .cornerRadius(15)
                                                    : nil
                                                )
                                            
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 46)
                            .background(Colors.gray.color)
                            .cornerRadius(15)
                            .padding(.trailing, 15)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Colors.darkGray.color)
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                
                CustomButton("추가", disabled: false) {
                    viewStore.send(.onTapAddButton)
                }
                .padding(.top, 80)
                .padding(.horizontal, 100)
                
            }
            Spacer()
        }
        .setBackground()
    }
}
