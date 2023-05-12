//
//  AuthProgress.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI

struct AuthProgress: View {
    
    let progress: Int

    init(_ progress: Int)
    {
        self.progress = progress
    }
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text("\(progress)/5")
                .setFont(18 ,.regular)
                .foregroundColor(Colors.gray.color)
                .autocapitalization(.none)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            GeometryReader { geometry in
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .opacity(0.3)
                        .foregroundColor(Colors.gray.color)
                    
                    Rectangle()
                        .frame(width: min(CGFloat(progress) * 0.2 * geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Colors.main.color)
                }
                .cornerRadius(45.0)
            }
            .frame(height: 4)
        }
        .padding([.horizontal, .bottom], 2)

    }
}
