//
//  CompletedChallengesView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct CompletedChallengesView : View {
    @Environment(Coordinator.self) var coordinator
    @Binding var challengeLists : ChallengeLists
    
    @State private var challengeList : [Challenge] = [
        Challenge(
            topic:"매일 아침식사 하기"
        ),
        Challenge(
            topic:"영양제 챙겨먹기"
        ),
    ]
    
    var body : some View {
        VStack(){
            
            ZStack(){
                VStack {
                    HStack{
                        Text(
                            "완료한 도전"
                        )
                        .font(
                            .basicFontLarge
                        )
                        .foregroundColor(
                            Color(
                                "FontColor"
                            )
                            
                        )
                        Spacer()
                        
                    }
                    ZStack{
                        Image(
                            "Mole"
                        )
                        .resizable()
                        .aspectRatio(
                            contentMode: .fit
                        )
                        .frame(
                            width: 300
                        )
                        .opacity(
                            0.2
                        )
                        List{
                            ForEach(
                                $challengeList
                            ){$challenge in
                                challengeRowView(for: challenge)
                            }
                        }
                        .listStyle(
                            .plain
                        )
                        .background(
                            Color.clear
                        )
                        .scrollContentBackground(
                            .hidden
                        )
                    }
                }
            }
        }
        .padding()
        .background(
            Color(
                "BackgroundColor"
            )
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: navigationBarCustomBackButton)
    }
    
    var navigationBarCustomBackButton : some View {
        Button{
            coordinator.pop()
        } label :{
            HStack{
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                Text("이전")
            }
        }
    }
    
    @ViewBuilder
    func challengeRowView(for challenge : Challenge) -> some View {
        HStack(){
            Text(
                challenge.topic
            )
            .font(
                .system(
                    size: 16
                )
            )
            Spacer()
            VStack (alignment: .trailing) {
                Text(
                    "도전 종료"
                )
                .font(
                    .system(
                        size: 14
                    )
                )
                Text(
                    challenge.getTimeString()
                )
                .font(
                    .system(
                        size: 16
                    )
                )
            }
        }
        .padding(
            EdgeInsets(
                top: 10,
                leading: 20,
                bottom: 10,
                trailing: 20
            )
        )
        .background(
            Color.white.opacity(
                0.5
            )
        )
        .listRowInsets(
            EdgeInsets(
                top: 0,
                leading: 0,
                bottom: 12,
                trailing: 0
            )
        )
        .listRowBackground(
            Color.clear
        )
        .listRowSeparator(
            .hidden
        )
        .cornerRadius(
            8
        )
        .overlay(
            RoundedRectangle(
                cornerRadius: 8
            )
            .stroke(
                Color(
                    "StrokeColor"
                ),
                lineWidth:1
            )
        )
    }
}
