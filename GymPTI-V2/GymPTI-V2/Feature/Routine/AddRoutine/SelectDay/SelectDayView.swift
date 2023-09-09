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
            
            HStack {
                
                Button {
                    viewStore.send(.onTapBackButton)
                } label: {
                    Image("Back")
                        .resizable()
                        .frame(width: 9, height: 15)
                }
                .frame(width: 42, height: 36)
                .padding(.bottom, 6)
                
                Spacer()
                
                Text("루틴 추가하기")
                    .setFont(18, .semibold)
                    .foregroundColor(Colors.white.color)
                    .padding(.bottom, 6)
                    .padding(.trailing, 42)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            
            VStack {
                
                Text("추가할 요일 선택")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach([("SUN", "일"), ("MON", "월"),
                             ("THE", "화"), ("WEN", "수"),
                             ("THU", "목"), ("FRI", "금"),
                             ("SAT", "토")], id: \.0) {
                        day, label in
                        Spacer()
                        
                        Button {
                            viewStore.send(.onSelectDayButton(day: label))
                            print("\(viewStore.selectedDay) == \(label)")
                        } label: {
                            
                            VStack(spacing: 10) {
                                
                                Text("\(day)")
                                    .setFont(14, .regular)
                                    .foregroundColor(viewStore.selectedDay == label ? Colors.main.color : Colors.white.color)
                                
                                Text("\(label)")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .background(
                                        Circle()
                                            .fill(viewStore.selectedDay == label ? Colors.main.color : Colors.black.color)
                                            .frame(width: 34, height: 34)
                                    )
                            }
                        }
                        .padding(.bottom, 8)
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
