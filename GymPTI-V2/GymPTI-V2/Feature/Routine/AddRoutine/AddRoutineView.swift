//
//  AddRoutineView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import SwiftUI
import ComposableArchitecture

public struct AddRoutineView {
    
    private let store: StoreOf<AddRoutine>
    @ObservedObject var viewStore: ViewStoreOf<AddRoutine>
    
    public init(store: StoreOf<AddRoutine>) {
        self.store = store
        viewStore = ViewStore(store, observe: { $0 })
    }
}

extension AddRoutineView: View {
    
    public var body: some View {
        
        let weekdays: [(String, String)] = [
            ("MON", "월"), ("THE", "화"), ("WEN", "수"),
            ("THU", "목"), ("FRI", "금"), ("SAT", "토"), ("SUN", "일")
        ] // 더미데이터
        
        let groups: [(String, String)] = [
            ("CHEST", "가슴"), ("BACK", "등"), ("LEGS", "하체"),
            ("SHLDR", "어깨"), ("ARM", "팔")
        ] // 더미데이터
        
        VStack(alignment: .center) {
            
            HStack {
                
                Button(action: {
                    viewStore.send(.onTapBackButton)
                }) {
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
                    
                    ForEach(weekdays, id: \.0) { (eng, kor) in
                        
                        Spacer()
                        WeekButton(eng, kor)
                            .padding(.bottom, 8)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(Colors.darkGray.color)
                .cornerRadius(10)
                
                Text("운동 종류 선택")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    ForEach(groups, id: \.0) { (eng, kor) in
                        
                        Spacer()
                        
                        Button(action: {
                            print("CHEST")
                        }) {
                            
                            VStack(spacing: 10) {
                                
                                Text("\(eng)")
                                    .setFont(14, .regular)
                                    .foregroundColor(Colors.white.color)
                                
                                Text("\(kor)")
                                    .setFont(16, .bold)
                                    .foregroundColor(Colors.white.color)
                                    .background(
                                        Rectangle()
                                            .fill(Colors.black.color)
                                            .frame(width: 58, height: 34)
                                            .cornerRadius(15)
                                    )
                            }
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
            
            CustomButton("다음", disabled: false) {
                print("운동이름")
            }
            .padding(.horizontal, 100)
            
            Spacer()
            
        }
        .setBackground()
    }
}
