//
//  StringExt.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import SwiftUI
import CryptoKit

extension String {
    
    /// 정규 표현식을 사용하여 문자열을 검증하는 함수
    ///
    /// - Parameter regex: 정규 표현식 문자열
    /// - Returns: 정규 표현식과 일치하는 경우 true, 그렇지 않으면 false
    func regex(_ regex: String) -> Bool {
        
        let temp = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return temp.evaluate(with: self)
    }
    
    /// 문자열을 SHA-512 해시로 변환하는 함수
    ///
    /// - Returns: SHA-512 해시로 변환된 문자열
    func hashedPassword() -> String {
        let hashedData = SHA512.hash(data: self.data(using: .utf8)!)
        return hashedData.map { String(format: "%02x", $0) }
            .joined()
            .uppercased()
    }
}
