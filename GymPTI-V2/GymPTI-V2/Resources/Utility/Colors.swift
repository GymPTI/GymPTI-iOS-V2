//
//  Colors.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI

enum Colors {
    
    /// - Note: 메인색
    case main
    
    /// - Note: 흰색
    case white
    
    /// - Note: 검은 색
    case black
    
    /// - Note: 밝은 회색
    case rightGray
    
    /// - Note: 회색
    case gray
    
    /// - Note: 진한 회색
    case darkGray
    
    /// - Note: 빨간색
    case red
    
    var color: Color {
        
        switch self {
            
        case .main:
            return Color(hex: 0x8D4BF9)
        case .white:
            return Color(hex: 0xF8F8F8)
        case .black:
            return Color(hex: 0x1B1A20)
        case .rightGray:
            return Color(hex: 0xC8C8C8)
        case .gray:
            return Color(hex: 0x3E3D45)
        case .darkGray:
            return Color(hex: 0x2E2D33)
        case .red:
            return Color(hex: 0xFF5252)
        }
    }
}
