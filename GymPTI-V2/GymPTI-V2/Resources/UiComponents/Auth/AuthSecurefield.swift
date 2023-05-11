//
//  AuthSecurefield.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

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
