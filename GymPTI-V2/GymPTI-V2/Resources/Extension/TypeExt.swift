//
//  TypeExt.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/14.
//

import SwiftUI
import CryptoKit

extension String {
    
    func regex(_ regex: String) -> Bool {
        
        let temp = NSPredicate(format: "SELF MATCHES %@", regex)
        
        return temp.evaluate(with: self)
    }
    
    func hashedPassword() -> String {
        let hashedData = SHA512.hash(data: self.data(using: .utf8)!)
        return hashedData.map { String(format: "%02x", $0) }
            .joined()
            .uppercased()
    }
}

extension [String: String] {
    
    func getValue(key: String) -> String? {
        first(where: { $0.key == key })?.value as? String
    }
}

