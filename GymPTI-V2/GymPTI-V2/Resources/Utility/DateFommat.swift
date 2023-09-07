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
    
    return dateToKor(today)
}

func getDate() -> String {
    
    dateFormatter.dateFormat = "yyyy년 M월 d일"
    let dateString = dateFormatter.string(from: Date())
    
    return "\(dateString) (\(getToday()))"
}

func dateToKor(_ today: String) -> String {
    
    let week: [String: String] = [
        "Sun": "일", "Mun": "월", "The": "화",
        "Wed": "수", "Thu": "목", "fri": "금", "Sat": "토"
    ]
    
    if let returnDay = week[today] {
        return returnDay
    } else {
        return today
    }
}

func getEnglishDayFullName(_ day: String) -> String {
    
    let week: [String: String] = [
        "일": "SUNDAY", "월": "MONDAY", "화": "TUESDAY",
        "수": "WEDNESDAY", "목": "THURSDAY",
        "금": "FRIDAY", "토": "SATURDAY"
    ]
    
    return week[day]!
}
