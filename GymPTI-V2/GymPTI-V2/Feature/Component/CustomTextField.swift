//
//  CustomTextField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

public struct CustomTextField: View {
    
    let text: Binding<String>
    let isSecurable: Bool
    
    @State var isEditing: Bool = false
    @State var strokeBorderOpacity: CGFloat = 0.3
    
    init(text: Binding<String>,
         isSecurable: Bool)
    {
        self.text = text
        self.isSecurable = isSecurable
    }
    
    public var body: some View {
        
        VStack(alignment: .leading) {
            
            TextField("", text: text) { isEditing in
                if isEditing {
                    strokeBorderOpacity = 1
                } else {
                    strokeBorderOpacity = 0.3
                }
            }
//            .keyboardType(.decimalPad)
            .setFont(14, .medium)
            .foregroundColor(Colors.white.color)
            .frame(maxWidth: .infinity, alignment: .leading)
            .autocapitalization(.none)
            .autocorrectionDisabled(true)
            .padding(.leading, 20)
            .onAppear {
                if isSecurable {
//                    text = text
                }
            }
            
        }
        .frame(height: 52)
        .background(Colors.black.color)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .strokeBorder(Colors.main.color.opacity(strokeBorderOpacity), lineWidth: 2))
        
    }
}
