//
//  DurationType.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/22/25.
//

import Foundation

enum DurationType : String, CaseIterable, Identifiable {
    case oneDay
    case threeDays
    case fiveDays
    case oneWeek
    
    var id : String{ self.rawValue}
    
    var displayName : String {
        switch self {
        case .oneDay: return "하루"
        case .threeDays: return "3일"
        case .fiveDays: return "5일"
        case .oneWeek: return "일주일"
        }
    }
}
