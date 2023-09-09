//
//  RoutineWeekButton.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/06.
//

import SwiftUI

struct RoutineWeekButton: View {
    
    let dayOfTheWeekOnEng: String
    let dayOfTheWeekOnKr: String
    let action: () -> Void
    
    init(_ dayOfTheWeekOnEng: String,
         _ dayOfTheWeekOnKr: String,
         action: @escaping () -> Void)
    {
        self.dayOfTheWeekOnEng = dayOfTheWeekOnEng
        self.dayOfTheWeekOnKr = dayOfTheWeekOnKr
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            VStack(spacing: 10) {
                
                Text("\(dayOfTheWeekOnEng)")
                    .setFont(14, .regular)
                    .foregroundColor(false ? Colors.main.color : Colors.white.color)
                
                Text("\(dayOfTheWeekOnKr)")
                    .setFont(16, .bold)
                    .foregroundColor(Colors.white.color)
                    .background(
                        Circle()
                            .fill(false ? Colors.main.color : Colors.black.color)
                            .frame(width: 34, height: 34)
                    )
            }
        }
    }
}
