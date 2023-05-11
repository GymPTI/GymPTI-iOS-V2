//
//  AuthComponents.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

class AuthComponents {
    
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
                    .background(disabled ? Color.clear : Color.accentColor)
                    .cornerRadius(15)
                    .autocapitalization(.none)
            }
            .disabled(disabled)
        }
    }
    
    struct AuthTextfield: View {
        
        let title: String
        let text: Binding<String>
        
        init(_ title: String,
             text: Binding<String>)
        {
            self.title = title
            self.text = text
        }
        
        var body: some View {
            
            VStack {
                
                TextField(title, text: text)
                    .setFont(18, .medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .autocapitalization(.none)
                    .padding(.leading, 20)
            }
            .frame(height: 52)

            .background(.white)
            .cornerRadius(15)
        }
    }
    
    struct AuthSecurefield: View {
        
        let title: String
        let text: Binding<String>
        
        init(_ title: String,
             text: Binding<String>)
        {
            self.title = title
            self.text = text
        }
        
        var body: some View {
            
            VStack {
                SecureField(title, text: text)
                    .setFont(18, .medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .autocapitalization(.none)
                    .padding(.leading, 20)
            }
            .frame(height: 52)
            .background(.white)
            .cornerRadius(15)
        }
    }

}
