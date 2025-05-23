//
//  Challenge.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/21/25.
//

import Foundation

struct Challenge : Identifiable {
    let id = UUID()
    var topic : String = ""
    var description : String = ""
    
    var isNotiEnabled : Bool = true
    var notiTime = Date()
    
    var challengeState : ChallengeStateType = .toDo
    
    let calendar = Calendar.current         // calendar 객체 선언
    var duration : DurationType = .oneWeek  // 도전 기한 선택
    var dueDate : Int = 7                   // 도전 기한
    
    var startDate : Date = Date()           // 도전 시작한 날
    var endDate : Date = Date()                      // 도전 끝 예정 날
    var completionDate : Date = Date()             // 진짜로 끝난 날
    
    func getTimeString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a h:mm"
        formatter.locale = Locale(identifier: "ko-KR")
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        let formattedTime = formatter.string(from : notiTime)
        
        return formattedTime
    }
        
    mutating func changeStateToDotoOngoing(){
        challengeState = .onGoing
        startDate = Date()
        
        switch duration {
        case .oneDay:
            dueDate = 1
        case .threeDays:
            dueDate = 3
        case .fiveDays:
            dueDate = 5
        case .oneWeek:
            dueDate = 7
        }
        
        endDate = calendar.date(byAdding: .day, value: dueDate, to: startDate)!
    }
    
    mutating func changeStateOngoingtoCompleted(){
        challengeState = .completed
    }
    mutating func changeStateOngoingtoToDo(){
        challengeState = .toDo
    }
}
