//
//  AuthTextField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

struct AuthTextfield: View {
    
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
                .foregroundColor(.white)
            
            VStack {
                
                TextField(message, text: text)
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
