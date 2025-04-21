//
//  CompletedChallengesView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct CompletedChallengesView : View {
    @Environment(Coordinator.self) var coordinator
    
    var body : some View {
        VStack{
            Text("도전 완료 뷰")
        }
    }
}

#Preview {
    CompletedChallengesView()
}
