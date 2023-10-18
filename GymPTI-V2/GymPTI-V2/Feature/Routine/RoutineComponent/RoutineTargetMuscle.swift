//
//  RoutineTargetMuscle.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/14.
//

import SwiftUI

struct RoutineTargetMuscle: View {
    
    let tag: String
    let muscleName: String
    let selectMuscle: String
    let action: () -> Void
    
    init(_ tag: String,
         _ muscleName: String,
         selectMuscle: String,
         action: @escaping () -> Void)
    {
        self.tag = tag
        self.muscleName = muscleName
        self.selectMuscle = selectMuscle
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Text("\(muscleName)")
                .setFont(16, .bold)
                .foregroundColor(Colors.white.color)
                .padding(15)
                .background(
                    Rectangle()
                        .fill(selectMuscle == tag ? Colors.main.color : Colors.black.color)
                        .frame(minWidth: 0, maxWidth: 200)
                        .frame(height: 34)
                        .cornerRadius(15)
                )
        }
    }
}
