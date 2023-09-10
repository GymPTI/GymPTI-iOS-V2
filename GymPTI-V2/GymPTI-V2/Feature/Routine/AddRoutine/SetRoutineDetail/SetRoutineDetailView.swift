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
                
                Text("운동 상세 설정")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal, 20)
            
            Stepper(value: viewStore.$reps, in: 0...30, step: 1) {
                Text("반복 횟수 : \(viewStore.reps)번")
            }
            
            Stepper(value: viewStore.$sets, in: 0...20, step: 1) {
                Text("세트 수 : \(viewStore.sets)회")
            }
            
            Stepper(value: viewStore.$restTime, in: 0...120, step: 15) {
                Text("휴식시간 : \(viewStore.restTime)초")
            }
            
            CustomButton("추가", disabled: false) {
                print("\(viewStore.exerciseName)\n\(getEnglishDayFullName(viewStore.day))\n\(viewStore.reps)\n\(viewStore.sets)\n\(viewStore.restTime)")
                viewStore.send(.onTapAddButton)
            }
            .padding(.top, 80)
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}
