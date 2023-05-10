//
//  NavigationView.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI

struct NavigationView<Content: View>: View {
    
    let title: String
    let action: () -> Void
    let content: Content
    
    init(_ title: String = "",
         _ action: @escaping () -> Void,
         @ViewBuilder content: () -> Content)
    {
        self.title = title
        self.action = action
        self.content = content()
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .leading) {
                Text(title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                Button(action: action) {
                    Image("arrow-left")
                        .resizable()
                        .frame(width: 24, height: 24)
                        
                }
                .padding(.leading, 20)
            }
            .padding(.vertical, 5)
            content
        }
        .setBackground()
    }
}

