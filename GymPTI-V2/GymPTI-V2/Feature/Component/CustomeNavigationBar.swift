//
//  CustomeNavigationBar.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/08/19.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    let title: String
    let backButtonAction: () -> Void
    
    init(_ title: String,
         _ backButtonAction: @escaping () -> Void)
    {
        self.title = title
        self.backButtonAction = backButtonAction
    }
    
    var body: some View {
        
        HStack {
            
            Button(action: {
                backButtonAction()
            }) {
                Image("Back")
                    .resizable()
                    .frame(width: 9, height: 15)
            }
            .frame(width: 42, height: 36)
            .padding(.bottom, 6)
            
            Spacer()
            
            Text("\(title)")
                .setFont(18, .semibold)
                .foregroundColor(Colors.white.color)
                .padding(.bottom, 6)
                .padding(.trailing, 42)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
        .background(Colors.darkGray.color)
    }
}
