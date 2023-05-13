//
//  CustomTextField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

struct CustomTextField: View {
    
    let title: String
    let text: Binding<String>
    
    @State var isEditing: Bool = false
    @State var strokeBorderOpacity: CGFloat = 0.3
    
    init(_ title: String,
         text: Binding<String>)
    {
        self.title = title
        self.text = text
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            TextField(title, text: text) { isEditing in
                if isEditing {
                    strokeBorderOpacity = 1
                } else {
                    strokeBorderOpacity = 0.3
                }
            }
            .setFont(14, .medium)
            .foregroundColor(Colors.white.color)
            .frame(maxWidth: .infinity, alignment: .leading)
            .autocapitalization(.none)
            .autocorrectionDisabled(true)
            .padding(.leading, 20)
            
        }
        .frame(height: 52)
        .background(Colors.black.color)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .strokeBorder(Colors.main.color.opacity(strokeBorderOpacity), lineWidth: 2))
        
    }
}
