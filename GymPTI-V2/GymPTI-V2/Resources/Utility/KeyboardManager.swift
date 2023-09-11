//
//  KeyboardManager.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI

/// 키보드 관리자 클래스
class KeyboardManager {
    
    /// 활성화된 키보드를 감추는 함수
    ///
    /// - Note: 현재 화면의 첫 번째 창을 확인하고 키보드를 감춥니다.
    static func dismissKeyboard() {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let mainWindow = windowScene.windows.first {
            mainWindow.endEditing(true)
        }
    }

    /// 탭 뷰의 배경을 터치하면 키보드를 감추는 함수
    ///
    /// - Note: 현재 활성화된 창을 확인하고 키보드를 감춥니다.
    static func dismissKeyboardOnTapBackground() {
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            keyWindow.endEditing(true)
        }
    }
}
