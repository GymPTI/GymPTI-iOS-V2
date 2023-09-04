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
        
        let weekdays: [(String, String)] = [
            ("MON", "월"), ("THE", "화"), ("WEN", "수"),
            ("THU", "목"), ("FRI", "금"), ("SAT", "토"), ("SUN", "일")
        ] // 더미데이터
        
        let routines: [(String, String, Int, Int, String)] = [
            ("풀 업", "상부 광배근, 전반적인 승모근 전체를 타겟 합니다.", 5, 10, "30초"),
            ("시티드 케이블 로우", "광배근, 하부 승모근을 타겟 합니다.", 12, 4, "1분 30초"),
            ("바벨 로우", "광배근을 전반적으로 타겟 합니다.", 10, 10, "1분 30초")
        ] // 더미데이터
        
        VStack {
            
            HStack {
                
                Text("루틴")
                    .setFont(34, .semibold)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    
                    Button(action: {
                        viewStore.send(.onTapAiAddRoutineButton)
                    }) {
                        Image("ai")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 40)
                    
                    Button(action: {
                        viewStore.send(.onTapAddRoutineButton)
                    }) {
                        Image("add")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Colors.white.color)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("\(getToday())")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                    
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
                    
                    Text("목요일 루틴")
                        .setFont(20, .bold)
                        .foregroundColor(Colors.white.color)
                    
                    ForEach(routines, id: \.0) { routines in
                        RoutineExcersizeCell(routines.0,
                                             targetMuscles: routines.1,
                                             reps: routines.2,
                                             sets: routines.3,
                                             restTime: routines.4
                        )
                        .padding(.bottom, 10)
                    }
                }
                .padding(.horizontal, 20)
                Spacer()
            }
        }
        .padding(.top, 20)
        .setBackground()
    }
}

extension RoutineView {
    
    func getToday() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        dateFormatter.dateFormat = "yyyy년 M월 d일 (E)"
        let dateString = dateFormatter.string(from: Date())
        
        return dateString
    }
}

struct WeekButton: View {
    
    let dayOfTheWeekOnEng: String
    let dayOfTheWeekOnKr: String
    
    @State private var isButtonPressed = false
    
    init(_ eng: String, _ kr: String)
    {
        dayOfTheWeekOnEng = eng
        dayOfTheWeekOnKr = kr
    }
    
    var body: some View {
        
        Button(action: {
            print("\(dayOfTheWeekOnKr)요일")
            isButtonPressed.toggle()
        }) {
            
            VStack(spacing: 10) {
                
                Text("\(dayOfTheWeekOnEng)")
                    .setFont(14, .regular)
                    .foregroundColor(isButtonPressed ? Colors.main.color : Colors.white.color)
                
                Text("\(dayOfTheWeekOnKr)")
                    .setFont(16, .bold)
                    .foregroundColor(Colors.white.color)
                    .background(
                        Circle()
                            .fill(isButtonPressed ? Colors.main.color : Colors.black.color)
                            .frame(width: 34, height: 34)
                    )
            }
        }
    }
}
