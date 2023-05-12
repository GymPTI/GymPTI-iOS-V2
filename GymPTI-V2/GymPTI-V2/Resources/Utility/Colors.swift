//
//  Colors.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI

enum Colors {
    
    case main
    case white
    case black
    case gray
    case darkGray
    
    var color: Color {
        
        switch self {
            
        case .main:
            return Color(hex: 0x9047ED)
        case .white:
            return Color(hex: 0xF8F8F8)
        case .black:
            return Color(hex: 0x1B1A20)
        case .gray:
            return Color(hex: 0xC8C8C8)
        case .darkGray:
            return Color(hex: 0x2E2D33)
        }
    }
}
