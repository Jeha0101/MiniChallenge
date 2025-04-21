//
//  TodoChallegesView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct ToDoChallegesView : View {
    @Environment(Coordinator.self) var coordinator
    
    var body : some View {
        VStack{
            Text("도전 예정 목록")
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("Hello")
            }
        }
    }
}

#Preview{
    ToDoChallegesView()
}
