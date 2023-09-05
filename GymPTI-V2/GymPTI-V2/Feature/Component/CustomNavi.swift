//
//  CustomNavi.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI

struct CustomNavi: View {
    
    let title: String
    let notificationButtonAction: () -> Void
    let settingButtonAction: () -> Void
    
    init(_ title: String,
         _ notificationButtonAction: @escaping () -> Void,
         _ settingButtonAction: @escaping () -> Void)
    {
        self.title = title
        self.notificationButtonAction = notificationButtonAction
        self.settingButtonAction = settingButtonAction
    }
    
    var body: some View {
        
        HStack {
            
            Text("\(title)")
                .setFont(34, .semibold)
                .foregroundColor(Colors.white.color)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                
                Button {
                    notificationButtonAction()
                } label: {
                    Image("bell")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 40)
                
                Button {
                    settingButtonAction()
                } label: {
                    Image("setting")
                        .resizable()
                        .frame(width: 22, height: 22)
                        .foregroundColor(Colors.white.color)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
}
