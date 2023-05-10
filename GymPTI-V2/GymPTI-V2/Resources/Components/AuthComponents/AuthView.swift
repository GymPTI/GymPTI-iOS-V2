//
//  AuthView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI

struct AuthView<TextField: View, Button: View>: View {
    
    let title: String
    let progress: Int
    let action: () -> Void
    let textField: TextField
    let button: Button
    
    init(_ title: String = "",
         _ progress: Int = 0,
         _ action: @escaping () -> Void,
         @ViewBuilder textField: () -> TextField,
         @ViewBuilder button: () -> Button)
    {
        self.title = title
        self.progress = progress
        self.action = action
        self.textField = textField()
        self.button = button()
    }
    
    var body: some View {
        NavigationView("") {
            action()
        } content: {
            VStack(alignment: .leading) {
                Text(title)
                    .setFont(34, .bold)
                    .padding(.leading, 10)
                    .autocapitalization(.none)
                
                textField
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("\(progress)/5")
                        .setFont(18, .regular)
                        .autocapitalization(.none)
                }
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .opacity(0.3)
                            .foregroundColor(Color.black)
                        
                        Rectangle()
                            .frame(width: min(CGFloat(progress) * 0.2 * geometry.size.width, geometry.size.width), height: geometry.size.height)
                            .foregroundColor(Color.red)
                    }
                    .cornerRadius(45.0)
                }
                .frame(height: 4)
                button
            }
            .padding()
        }
    }
}
