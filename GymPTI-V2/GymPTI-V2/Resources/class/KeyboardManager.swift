//
//  KeyboardManager.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI

class KeyboardManager {
    
    static func downKeyborad() {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let mainWindow = windowScene.windows.first {
            mainWindow.endEditing(true)
        }
    }

    static func tabBackgroundDownKeyborad() {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            keyWindow.endEditing(true)
        }
        
    }
}
