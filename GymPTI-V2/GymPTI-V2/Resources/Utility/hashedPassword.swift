//
//  AuthManager.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/12.
//

import SwiftUI
import CryptoKit

public func hashedPassword(_ password: String) -> String {
    
    let hashedData = SHA512.hash(data: password.data(using: .utf8)!)
    return hashedData.map { String(format: "%02x", $0) }
        .joined()
        .uppercased()
}
