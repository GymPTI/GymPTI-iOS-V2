//
//  CustomNavi.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI

struct CustomNavi: View {
    
    let title: String
    let action: () -> Void
    
    init(_ title: String,
         _ action: @escaping () -> Void)
    {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        
        VStack {
            Button(action: {
                action()
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 10, height: 18)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(title)")
                .setFont(34, .bold)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
