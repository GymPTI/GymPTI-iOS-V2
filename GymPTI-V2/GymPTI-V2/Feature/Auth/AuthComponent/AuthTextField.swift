//
//  AuthTextField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

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
        .background(Colors.white.color)
        .cornerRadius(15)
    }
}
