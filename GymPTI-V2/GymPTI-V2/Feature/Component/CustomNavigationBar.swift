//
//  CustomNavigationBar.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/10.
//

import SwiftUI

struct CustomNavigationBar: View {
    
    let title: String
    let leadingButtonAction: () -> Void
    let trailingButtonTitle: String
    let trailingButtonAction: () -> Void
    let trailingButtonDisabled: Bool
    
    init(title: String,
         leadingButtonAction: @escaping () -> Void,
         trailingButtonTitle: String = "",
         trailingButtonAction: @escaping () -> Void = {},
         trailingButtonDisabled: Bool = false)
    {
        self.leadingButtonAction = leadingButtonAction
        self.title = title
        self.trailingButtonAction = trailingButtonAction
        self.trailingButtonTitle = trailingButtonTitle
        self.trailingButtonDisabled = trailingButtonDisabled
    }
    
    var body: some View {
        
        HStack {
            
            Button {
                leadingButtonAction()
            } label: {
                Image("back")
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
            
            Spacer()
            
            Button {
                trailingButtonAction()
            } label: {
                Text("\(trailingButtonTitle)")
                    .setFont(16, .regular)
                    .foregroundColor(Colors.white.color)
            }
            .frame(width: 32, height: 36)
            .padding(.bottom, 6)
            .padding(.trailing, 10)
            .disabled(trailingButtonDisabled)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 40)
    }
}
