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
    
    @FocusState var isFocusing: Bool
    
    init(text: Binding<String>,
         isSecurable: Bool)
    {
        self.text = text
        self.isSecurable = isSecurable
    }
    
    public var body: some View {
        
        VStack(alignment: .leading) {
            
            if isSecurable {
                
                SecureField("", text: text)
                    .focused($isFocusing)
                    .setFont(14, .medium)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .padding(.leading, 20)
                
            } else {
                
                TextField("", text: text)
                    .focused($isFocusing)
                    .setFont(14, .medium)
                    .foregroundColor(Colors.white.color)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .autocapitalization(.none)
                    .autocorrectionDisabled(true)
                    .padding(.leading, 20)
            }
        }
        .frame(height: 52)
        .background(Colors.black.color)
        .overlay(RoundedRectangle(cornerRadius: 10)
            .strokeBorder({ () -> Color in
                let color = Colors.main.color
                let opacity = isFocusing ? 1 : 0.3
                return color.opacity(opacity)
            }(), lineWidth: 2))
    }
}
