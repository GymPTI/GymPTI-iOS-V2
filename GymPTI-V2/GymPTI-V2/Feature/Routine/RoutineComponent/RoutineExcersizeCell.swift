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
    let isCompleted: Bool
    let longPressGestureAction: () -> Void
    let completedButtonAction: () -> Void
    
    @State var isTapCardView: Bool = false
    
    init(_ excerciseName: String,
         targetMuscles: String,
         reps: Int,
         sets: Int,
         restTime: Int,
         isCompleted: Bool,
         longPressGestureAction: @escaping () -> Void,
         completedButtonAction: @escaping () -> Void)
    {
        self.excerciseName = excerciseName
        self.targetMuscles = targetMuscles
        self.sets = sets
        self.reps = reps
        self.restTime = restTime
        self.isCompleted = isCompleted
        self.longPressGestureAction = longPressGestureAction
        self.completedButtonAction = completedButtonAction
    }
    
    var body: some View {
        
        Button { } label: {
            
            VStack(alignment: .leading, spacing: 20) {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text("\(excerciseName)")
                            .setFont(20, .bold)
                            .foregroundColor(Colors.white.color)
                        
                        Text("\(targetMuscles)")
                            .setFont(14, .regular)
                            .foregroundColor(Colors.white.color)
                    }
                    
                    Spacer()
                    
                    Button {
                        completedButtonAction()
                    } label : {
                        Rectangle()
                            .frame(width: 22, height: 22)
                            .foregroundColor(Colors.gray.color)
                            .cornerRadius(4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Colors.white.color, lineWidth: 2)
                            )
                    }
                }
                
                if isTapCardView {
                    
                    VStack(spacing: 5) {
                        
                        HStack {
                            Image("timer")
                            
                            Text("\(reps)회 • \(sets)세트")
                                .setFont(14, .regular)
                                .foregroundColor(Colors.white.color)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack {
                            Image("rest")
                            
                            Text("각 세트 후 \(Text(secondsToMinutesAndSeconds(seconds: restTime)).bold()) 휴식")
                                .setFont(14, .regular)
                                .foregroundColor(Colors.white.color)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.vertical, 15)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: isTapCardView ? 140 : 76)
            .background(Colors.darkGray.color)
            .cornerRadius(10)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isTapCardView.toggle()
                }
            }
            .onLongPressGesture(minimumDuration: 0.25) {
                longPressGestureAction()
            }
            .opacity(isCompleted ? 0.5 : 1)
        }
    }
}
