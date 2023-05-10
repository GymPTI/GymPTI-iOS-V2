//
//  AuthTextField.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI

struct AuthTextfield: View {
    
    let title: String
    let subTitle: String
    let text: Binding<String>
    
    init(_ title: String,
         _ subTitle: String,
         text: Binding<String>)
    {
        self.title = title
        self.subTitle = subTitle
        self.text = text
    }
    
    var body: some View {
        
        VStack {
            
            TextField(title, text: text)
                .setFont(18, .medium)
                .frame(height: 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .autocapitalization(.none)
            
            Divider()
                .frame(height: 2)
                .background(Color.black)
            
            Text(subTitle)
                .setFont(12, .light)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.leading, 10)
        
    }
}
