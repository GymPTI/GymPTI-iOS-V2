//
//  RoutineExcersizeCell.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/20.
//

import SwiftUI

struct RoutineExcersizeCell: View {
    
    let excersizeName: String
    let targetMuscles: String
    let reps: Int
    let sets: Int
    let restTime: String
    
    init(_ excersizeName: String,
         targetMuscles: String,
         reps: Int,
         sets: Int,
         restTime: String)
    {
        self.excersizeName = excersizeName
        self.targetMuscles = targetMuscles
        self.sets = sets
        self.reps = reps
        self.restTime = restTime
    }
    
    var body: some View {
        
        Button {
            
            print("운동")
        } label: {
            
            VStack(alignment: .leading, spacing: 4) {
                
                Text("\(excersizeName)")
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
            .padding(.leading, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 140)
            .background(Colors.darkGray.color)
            .cornerRadius(10)
        }
    }
}

