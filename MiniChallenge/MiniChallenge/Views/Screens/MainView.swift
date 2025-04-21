//
//  MainView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct MainView: View {
    @Environment(Coordinator.self) var coordinator
    
    var body : some View {
        NavigationStack(){
            VStack(){
                Button(action:{
                    coordinator.push(.toDoChallenges)
                }){
                    Text("다음")
                }
                
                HStack(){
                    // 앱바..?
                }
                HStack(){
                    // 완료, 예정 목록 버튼 영역
                    Text("main 뷰")
                }
                VStack(){
                    // 현재 도전 목록 영역
                }
            }
        }
        
    }
}

#Preview {
    MainView()
}
