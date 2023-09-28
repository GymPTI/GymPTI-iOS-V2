//
//  CustomTextField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

public struct CustomTextField: View {
    
    @Binding var text: String
    let isSecurable: Bool
    
    @State private var isPasswordVisible: Bool = false
    @FocusState private var isFocusing: Bool
    
    init(text: Binding<String>, isSecurable: Bool = false) {
        _text = text
        self.isSecurable = isSecurable
    }
    
    private var inputField: some View {
        
        Group {
            if isSecurable {
                if isPasswordVisible {
                    TextField("", text: $text)
                } else {
                    SecureField("", text: $text)
                }
            } else {
                TextField("", text: $text)
            }
        }
        .setFont(14, .medium)
        .foregroundColor(Colors.white.color)
        .frame(maxWidth: .infinity, alignment: .leading)
        .autocapitalization(.none)
        .autocorrectionDisabled(true)
        .padding(.leading, 20)
    }
    
    public var body: some View {
        
        HStack {
            inputField
            if isSecurable {
                Button {
                    isPasswordVisible.toggle()
                    if isPasswordVisible {
                        isFocusing = true
                    }
                } label: {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye")
                }
                .padding(.trailing, 20)
            }
        }
        .frame(height: 52)
        .background(Colors.black.color)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder({ () -> Color in
                    let color = Colors.main.color
                    let opacity = isFocusing ? 1 : 0.3
                    return color.opacity(opacity)
                }(), lineWidth: 2)
        )
        .focused($isFocusing)
    }
}
