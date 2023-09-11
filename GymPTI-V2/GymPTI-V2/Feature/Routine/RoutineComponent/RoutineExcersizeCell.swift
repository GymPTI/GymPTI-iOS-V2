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
    let restTime: String
    let action: () -> Void
    
    init(_ excerciseName: String,
         targetMuscles: String,
         reps: Int,
         sets: Int,
         restTime: String,
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
        
        VStack(alignment: .leading, spacing: 4) {
            
            Text("\(excerciseName)")
                .setFont(20, .bold)
                .foregroundColor(Colors.white.color)
            
            Text("\(targetMuscles)")
                .setFont(14, .regular)
                .foregroundColor(Colors.white.color)
            
            HStack {
                
                Image("timer")
                
                Text("\(reps)회 / \(sets)세트")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
            }
            .padding(.top, 10)
            
            HStack {
                
                Image("rest")
                
                Text("각 세트 후 \(restTime) 휴식")
                    .setFont(14, .regular)
                    .foregroundColor(Colors.white.color)
            }
            
        }
        .padding(.bottom, 10)
        .padding(.leading, 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 140)
        .background(Colors.darkGray.color)
        .cornerRadius(10)
        .gesture(
            LongPressGesture(minimumDuration: 0)
                .onEnded { _ in
                    action()
                }
        )
    }
}

