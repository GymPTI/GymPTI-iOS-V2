//
//  CustomBackNavi.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/06/01.
//

import SwiftUI

struct CustomBackNavi: View {
    
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
                    .frame(width: 10, height: 18)
            }
            
            Spacer()
            
            Text("\(title)")
                .setFont(24, .semibold)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .ignoresSafeArea(.keyboard)

    }
}
