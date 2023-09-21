//
//  AppInfoManager.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/21.
//

import Foundation

/// 유틸리티 함수를 제공하는 클래스

public class AppInfoManager {
    
    /// 현재 앱의 버전을 가져오는 함수
    ///
    /// - Returns: 앱의 버전 문자열
    internal static func getAppVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    
    /// 현재 앱의 빌드 버전을 가져오는 함수
    ///
    /// - Returns: 앱의 빌드 버전 문자열
    internal static func getBuildVersion() -> String {
        return Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }
}
