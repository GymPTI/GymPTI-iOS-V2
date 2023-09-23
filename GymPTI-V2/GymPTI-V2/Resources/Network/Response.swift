//
//  Response.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import Foundation

class Response<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}

struct ErrorResponse: Codable {
    let timestamp: String
    let status: Int
    let code: String
    let message: String?
}
