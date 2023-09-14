//
//  SelectDayView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import SwiftUI
import ComposableArchitecture

public struct SelectDayView {
    
    private let store: StoreOf<SelectDay>
    @ObservedObject var viewStore: ViewStoreOf<SelectDay>
    
    public init(store: StoreOf<SelectDay>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension SelectDayView: View {
    
    public var body: some View {
        
        VStack(alignment: .center) {
            
            CustomNavigationBar(title: "루틴 추가하기") {
                viewStore.send(.onTapBackButton)
            }
            
            VStack {
                
                Text("요일을 선택해주세요!")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach([("SUN", "일"), ("MON", "월"),
                             ("THE", "화"), ("WEN", "수"),
                             ("THU", "목"), ("FRI", "금"),
                             ("SAT", "토")], id: \.0) { day, label in
                        Spacer()
                        
                        RoutineWeekButton(day, label, selecetDay: viewStore.selectedDay) {
                            
                            viewStore.send(.onSelectDayButton(day: label))
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            
            CustomButton("다음", disabled: !viewStore.isSelected) {
                viewStore.send(.onTapNextButton)
            }
            .padding(.top, 80)
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}
