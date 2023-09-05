//
//  SettingButton.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/18.
//

import SwiftUI

struct SettingButton: View {
    
    let title: String
    let action: () -> Void
    
    init(_ title: String,
         _ action: @escaping () -> Void)
    {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack {
                Text("\(title)")
                    .setFont(14, .medium)
                    .foregroundColor(Colors.white.color)
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
