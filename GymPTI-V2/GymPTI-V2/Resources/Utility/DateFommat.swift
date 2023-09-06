//
//  DateFommat.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/06.
//

import Foundation

fileprivate let dateFormatter = DateFormatter()

func getToday() -> String {
    
    dateFormatter.dateFormat = "E"
    let today = dateFormatter.string(from: Date())
    
    return today
}

func getDate() -> String {
    
    dateFormatter.dateFormat = "yyyy년 M월 d일 (E)"
    let dateString = dateFormatter.string(from: Date())
    
    return dateString
}
