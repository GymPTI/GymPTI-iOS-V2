//
//  RoutineExcersizeCardView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import SwiftUI

struct RoutineExcersizeCardView: View {
    
    let excerciseName: String
    let targetMuscles: String
    let reps: Int
    let sets: Int
    let restTime: Int
    let action: () -> Void
    
    @State var isTapCardView: Bool = false
    
    init(_ excerciseName: String,
         targetMuscles: String,
         reps: Int,
         sets: Int,
         restTime: Int,
         action: @escaping () -> Void)
    {
        self.excerciseName = excerciseName
        self.targetMuscles = targetMuscles
        self.sets = sets
        self.reps = reps
        self.restTime = restTime
        self.action = action
    }
    
    var body: some View {
        
        Button { } label: {
            VStack(alignment: .leading, spacing: 5) {
                
                Text("\(excerciseName)")
                    .setFont(20, .bold)
                    .foregroundColor(Colors.white.color)
                
                Text("\(targetMuscles)")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
                
                if isTapCardView {
                    
                    HStack {
                        
                        Image("timer")
                        
                        Text("\(reps)회 • \(sets)세트")
                            .setFont(14, .regular)
                            .foregroundColor(Colors.white.color)
                    }
                    .padding(.top, 10)
                    
                    HStack {
                        
                        Image("rest")
                        
                        Text("각 세트 후 \(Text(secondsToMinutesAndSeconds(seconds: restTime)).bold()) 휴식")
                            .setFont(14, .regular)
                            .foregroundColor(Colors.white.color)
                    }
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: isTapCardView ? 139 : 76)
            .background(Colors.darkGray.color)
            .cornerRadius(10)
            .onTapGesture {
                isTapCardView.toggle()
            }
            .onLongPressGesture(minimumDuration: 0.5) {
                action()
            }
        }
    }
}

