//
//  RoutineTargetMuscle.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/14.
//

import SwiftUI

struct RoutineTargetMuscle: View {
    
    let eng: String
    let kor: String
    let selectMuscle: String
    let action: () -> Void
    
    init(_ eng: String,
         _ kor: String,
         selectMuscle: String,
         action: @escaping () -> Void)
    {
        self.eng = eng
        self.kor = kor
        self.selectMuscle = selectMuscle
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            
            VStack(spacing: 10) {
                
                Text("\(eng)")
                    .setFont(14, .regular)
                    .foregroundColor(selectMuscle == eng ? Colors.main.color : Colors.white.color)
                
                Text("\(kor)")
                    .setFont(16, .bold)
                    .foregroundColor(Colors.white.color)
                    .background(
                        Rectangle()
                            .fill(selectMuscle == eng ? Colors.main.color : Colors.black.color)
                            .frame(width: 58, height: 34)
                            .cornerRadius(15)
                    )
            }
        }
    }
}
