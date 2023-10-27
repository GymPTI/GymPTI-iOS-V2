//
//  CustomButton.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/19.
//

import SwiftUI

struct CustomButton: View {
    
    let text: String
    let disabled: Bool
    let action: () -> Void
    
    init(_ text: String,
         disabled: Bool,
         _ action: @escaping () -> Void)
    {
        self.text = text
        self.disabled = disabled
        self.action = action
    }
    
    var body: some View {
        Button {
            action()
            KeyboardManager.dismissKeyboardOnTapBackground()
        } label: {
            Text(text)
                .setFont(18, .semibold)
                .foregroundColor(Colors.white.color)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(disabled ? Colors.main.color.opacity(0.3) : Colors.main.color)
                .cornerRadius(50)
        }
        .scaledButtonStyle()
        .disabled(disabled)
    }
}
