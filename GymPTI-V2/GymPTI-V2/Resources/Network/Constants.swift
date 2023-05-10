//
//  Constants.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import Foundation

public let API: String = "http://veryhotseo81.duckdns.org:8888/gympti"

enum TokenType {
    case accessToken
    case refreshToken
}

class Token {
    
    static func get(_ tokenType: TokenType) -> String? {
        return UserDefaults.standard.string(forKey: String(describing: tokenType))
    }

    static func save(_ tokenType: TokenType, _ value: String) {
        UserDefaults.standard.set(value, forKey: String(describing: tokenType))
    }

    static func remove(_ tokenType: TokenType) {
        UserDefaults.standard.removeObject(forKey: String(describing: tokenType))
    }
}
