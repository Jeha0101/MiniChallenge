//
//  Challenge.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/21/25.
//

import Foundation

enum DurationType {
    case oneDay
    case threeDays
    case fiveDays
    case oneWeek
    
    var displayName : String {
        switch self {
        case .oneDay: return "하루"
        case .threeDays: return "3일"
        case .fiveDays: return "5일"
        case .oneWeek: return "7일"
        }
    }
}

enum ChallengeStateType {
    case toDo
    case onGoing
    case completed
}

struct Challenge : Identifiable {
    let id = UUID()
    var topic : String = ""
    var description : String = ""
    
    var duration : DurationType = .oneWeek
    var isNotiEnabled : Bool = true
    var notiTime : String = ""//String..은 아닐텐데 나중에 다시 알아보자
    
    var challengeState : ChallengeStateType = .toDo
    
    var startDate : String = ""
    var dueDate : String = ""
    var completionDate : String = "" //이 곳 타입도 나중에 고치기
}
