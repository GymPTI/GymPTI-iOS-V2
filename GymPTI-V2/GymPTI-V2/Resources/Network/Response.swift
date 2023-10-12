//
//  Response.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/05/10.
//

import Foundation

struct Response: Codable {
    let status: Int
    let message: String
}

class DataResponse<T: Codable>: Codable {
    var status: Int
    var message: String
    var data: T
}
