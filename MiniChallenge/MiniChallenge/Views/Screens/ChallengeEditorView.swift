//
//  ChallengeEditorView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct ChallengeEditorView : View {
    @Environment(Coordinator.self) var coordinator    
    var body : some View {
        VStack{
            Text("도전 수정 뷰")
        }
    }
}

#Preview {
    ChallengeEditorView()
        .environment(Coordinator())
}
