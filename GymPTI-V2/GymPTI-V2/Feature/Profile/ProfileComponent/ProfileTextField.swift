//
//  ProfileTextField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI

struct ProfileTextField: View {
    
    let title: String
    let message: String
    let text: Binding<String>
    
    init(_ title: String,
         _ message: String = "",
         text: Binding<String>)
    {
        self.title = title
        self.message = message
        self.text = text
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .setFont(18, .medium)
                .foregroundColor(Colors.white.color)
            
            VStack {
                
                TextField(message, text: text)
                    .setFont(14, .regular)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    .autocapitalization(.none)
            }
            .frame(height: 40)
            .background(Colors.darkGray.color)
            .cornerRadius(10)
        }
    }
}
