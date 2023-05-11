//
//  ViewExt.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI

extension View {
    
    @ViewBuilder func setFont(_ size: CGFloat, _ weight: Font.Weight = .regular) -> some View {
        self
            .font(.system(size: size, weight: weight))
    }
    
    @ViewBuilder func setBackground() -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BackgroundColor"))
            .onTapGesture {
                KeyboardManager.tabBackgroundDownKeyborad()
            }
    }
}

