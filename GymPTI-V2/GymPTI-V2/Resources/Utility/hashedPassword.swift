//
//  AuthManager.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import CryptoKit

/// 문자열을 hash 암호화 하는 함수
/// - Parameters: password: String
/// - Returns: SHA512 로 암호화 된 문자열
public func hashedPassword(_ password: String) -> String {
    
    let hashedData = SHA512.hash(data: password.data(using: .utf8)!)
    return hashedData.map { String(format: "%02x", $0) }
        .joined()
        .uppercased()
}
