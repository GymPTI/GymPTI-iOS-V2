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
            
            VStack {
                
                Text("운동의 상세한 설정을 해주세요!")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                SetDetailView(viewStore: viewStore)
            }
            .padding(.horizontal, 20)
            
            CustomButton("추가", disabled: false) {
                //                viewStore.send(.onTapAddButton)
                print(viewStore.reps)
            }
            .padding(.top, 80)
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}

extension SetRoutineDetailView {
    
    struct SetDetailView: View {
        
        let viewStore: ViewStoreOf<SetRoutineDetail>
        
        init(viewStore: ViewStoreOf<SetRoutineDetail>) {
            self.viewStore = viewStore
        }
        
        var body: some View {
            
            VStack(spacing: 10) {
                
                HStack(spacing: 10) {
                    
                    Image("timer")
                        .padding(.leading, 15)
                    
                    Text("반복 횟수")
                        .setFont(16, .bold)
                        .foregroundColor(Colors.white.color)
                        .frame(width: 60, alignment: .leading)
                    
                    Text("\(viewStore.reps)")
                        .setFont(14, .medium)
                        .foregroundColor(Colors.white.color)
                        .frame(minWidth: 0, maxWidth: 50)
                        .frame(height: 46)
                        .background(Colors.gray.color)
                        .cornerRadius(15)
                    
                    Text("회")
                        .setFont(16, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button {
                            viewStore.send(.onTapMinusRepsButton)
                        } label: {
                            Text("-")
                        }
                        
                        Button {
                            viewStore.send(.onTapPlusRepsButton)
                        } label: {
                            Text("+")
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
                
                HStack(spacing: 10) {
                    
                    Image("timer")
                        .padding(.leading, 15)
                    
                    Text("세트 수")
                        .setFont(16, .bold)
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
                        .setFont(16, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
                
            }
        }
    }
}
