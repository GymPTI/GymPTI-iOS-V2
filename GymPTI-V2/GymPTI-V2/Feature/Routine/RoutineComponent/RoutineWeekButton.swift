//
//  RoutineWeekButton.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/06.
//

import SwiftUI

struct RoutineWeekButton: View {
    
    let day: String
    let label: String
    let selecetDay: String
    let action: () -> Void
    
    init(_ day: String,
         _ label: String,
         selecetDay: String,
         action: @escaping () -> Void)
    {
        self.day = day
        self.label = label
        self.selecetDay = selecetDay
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            VStack(spacing: 10) {
                
                Text("\(day)")
                    .setFont(14, .regular)
                    .foregroundColor(selecetDay == label ? Colors.main.color : Colors.white.color)
                
                Text("\(label)")
                    .setFont(16, .bold)
                    .foregroundColor(Colors.white.color)
                    .background(
                        Circle()
                            .fill(selecetDay == label ? Colors.main.color : Colors.black.color)
                            .frame(width: 34, height: 34)
                    )
            }
        }
        .padding(.bottom, 8)
    }
}
