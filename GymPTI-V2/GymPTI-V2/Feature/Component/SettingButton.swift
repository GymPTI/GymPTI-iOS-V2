//
//  SettingButton.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/18.
//

import SwiftUI

struct SettingButton: View {
    
    let title: String
    let isDangerous: Bool
    let action: () -> Void
    
    init(_ title: String,
         isDangerous: Bool = false,
         _ action: @escaping () -> Void)
    {
        self.title = title
        self.isDangerous = isDangerous
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack {
                Text("\(title)")
                    .setFont(14, .medium)
                    .foregroundColor(isDangerous ? Colors.red.color : Colors.white.color)
                    .padding(.leading, 15)
                
                Spacer()
                
                Image("go")
                    .padding(.trailing, 15)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Colors.darkGray.color)
            .cornerRadius(10)
        }
    }
}
