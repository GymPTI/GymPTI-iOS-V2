//
//  AuthButton.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

struct AuthButton: View {
    
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
        Button(action: action) {
            Text(text)
                .setFont(16, .semibold)
                .foregroundColor(.white)
                .frame(height: 52)
                .frame(maxWidth: .infinity)
                .background(disabled ? Color.accentColor.opacity(0.3) : Color.accentColor)
                .cornerRadius(15)
                .autocapitalization(.none)
        }
    }
}
