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
    
    @State var isTouchEyes: Bool = false
    
    init(_ title: String,
         text: Binding<String>)
    {
        self.title = title
        self.text = text
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                if !isTouchEyes {
                    SecureField(title, text: text)
                        .setFont(18, .medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .autocapitalization(.none)
                        .padding(.leading, 20)
                } else {
                    TextField(title, text: text)
                        .setFont(18, .medium)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .autocapitalization(.none)
                        .padding(.leading, 20)
                }
                
                Button(action: {
                    isTouchEyes.toggle()
                }) {
                    if !isTouchEyes {
                        Image(systemName: "eye")
                            .foregroundColor(Color(.systemGray3))
                    } else {
                        Image(systemName: "eye.fill")
                            .foregroundColor(Colors.black.color)
                    }
                }
                .padding(.trailing, 10)
                
            }
            .frame(height: 52)
            .background(Colors.white.color)
            .cornerRadius(15)
        }
    }
}
