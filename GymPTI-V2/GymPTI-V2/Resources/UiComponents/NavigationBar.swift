//
//  NavigationBar.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/11.
//

import SwiftUI

struct NavigationBar: View {
    
    let leftButtonImage: String
    let rightButtonImage: String
    let leftButtonAction: () -> Void
    let rightButtonAction: () -> Void
    
    init(_ leftButtonImage: String = "arrow.left",
         _ leftButtonAction: @escaping () -> Void,
         _ rightButtonImage: String = "",
         _ rightButtonAction: @escaping () -> Void)
    {
        self.leftButtonImage = leftButtonImage
        self.leftButtonAction = leftButtonAction
        self.rightButtonImage = rightButtonImage
        self.rightButtonAction = rightButtonAction
    }
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                
                Button(action: {
                    leftButtonAction()
                }) {
                    Image(systemName: "\(leftButtonImage)")
                        .setFont(23, .light)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                Button(action: {
                    rightButtonAction()
                }) {
                    Image(systemName: "\(rightButtonImage)")
                        .setFont(23, .light)
                }
                .padding(.trailing, 15)
            }
            .padding(.vertical, 5)
        }
    }
}
