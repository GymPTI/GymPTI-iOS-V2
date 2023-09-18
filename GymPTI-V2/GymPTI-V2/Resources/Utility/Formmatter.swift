//
//  Fommat.swift
//  GymPTI-V2
//
//  Created by 이민규 on 2023/09/06.
//

import Foundation

fileprivate let dateFormatter = DateFormatter()

/// 영어 요일을 한글로 변환하는 함수
///
/// - Parameter day: 영어 요일 문자열
/// - Returns: 한글 요일 문자열
func dateToKor(_ day: String) -> String {
    
    let week: [String: String] = [
        "Sun": "일", "Mon": "월", "Tue": "화",
        "Wed": "수", "Thu": "목", "Fri": "금", "Sat": "토"
    ]
    return week[day] ?? day
}

/// 현재 요일을 문자열로 반환하는 함수
///
/// - Returns: 요일 문자열 (한글)
func getToday() -> String {
    
    dateFormatter.dateFormat = "E"
    let today = dateFormatter.string(from: Date())
    
    return dateToKor(today)
}

/// 현재 날짜와 요일을 문자열로 반환하는 함수
///
/// - Returns: "yyyy년 M월 d일 (요일)" 형식의 문자열
func getDate() -> String {
    
    dateFormatter.dateFormat = "yyyy년 M월 d일"
    let dateString = dateFormatter.string(from: Date())
    let today = getToday()
    
    return "\(dateString) (\(today))"
}

/// 한글 요일을 영어로 변환하는 함수
///
/// - Parameter day: 한글 요일 문자열
/// - Returns: 영어 요일 문자열
func getEnglishDayFullName(_ day: String) -> String {
    
    let week: [String: String] = [
        "일": "SUNDAY", "월": "MONDAY", "화": "TUESDAY",
        "수": "WEDNESDAY", "목": "THURSDAY",
        "금": "FRIDAY", "토": "SATURDAY"
    ]
    return week[day] ?? day
}

func secondsToMinutesAndSeconds(seconds: Int) -> String {
    
    let minutes = seconds / 60
    let remainingSeconds = seconds % 60
    
    switch (minutes, remainingSeconds) {
    case (0, _):
        return "\(remainingSeconds)초"
    case (_, 0):
        return "\(minutes)분"
    default:
        return "\(minutes)분 \(remainingSeconds)초"
    }
}
