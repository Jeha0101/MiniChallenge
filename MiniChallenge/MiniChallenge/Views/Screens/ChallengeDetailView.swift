//
//  Untitled.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/23/25.
//

import SwiftUI

struct ChallengeDetailView: View {
    @Binding var challengeLists : ChallengeLists
    @Binding var challenge: Challenge
    var onClose: () -> Void

    var body: some View {
        VStack {
            VStack(spacing: 0) {
                Spacer(minLength: 12)
                HStack {
                    Text("")
                        .frame(width: 62)
                    Text("도전장")
                        .font(.basicFontTitle)
                        .padding(.bottom, 16)
                        .foregroundColor(
                            Color(
                                "FontColor"
                            )
                        )
                    Image("Shovel")
                        .resizable()
                        .frame(width: 62, height: 66)
                }
                VStack {
                    Spacer()
                    HStack {
                        Image("QuotationMarkLeft")
                            .resizable()
                            .frame(width: 24, height: 15)
                        Spacer()
                        Text("용감한 나는")
                            .font(.basicFontLarge)
                            .foregroundColor(
                                Color(
                                    "FontColor"
                                )
                            )
                        Spacer()
                        Text("")
                            .frame(width: 24)
                    }
                    Text("\(challenge.topic)에")
                        .font(.basicFontLarge)
                        .foregroundColor(
                            Color(
                                "FontColor"
                            )
                        )
                    HStack {
                        Text("")
                            .frame(width: 24)
                        Spacer()
                        Text("도전한다")
                            .font(.basicFontLarge)
                            .foregroundColor(
                                Color(
                                    "FontColor"
                                )
                            )
                        Spacer()
                        Image("QuotationMarkRight")
                            .resizable()
                            .frame(width: 24, height: 15)
                    }
                    Spacer()
                    ZStack {
                        VStack {
                            HStack {
                                Text("소요시간")
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontColor"))
                                Spacer()
                                Text("\(challenge.duration.displayName)")
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontColor"))
                            }
                            .padding(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                            Divider()
                            HStack {
                                Text("알림 수신")
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontColor"))
                                Spacer()
                                Text("\(challenge.duration.displayName)")
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontColor"))
                            }
                            
                            Divider()
                            HStack {
                                var notiTime : String = challenge.getTimeString()
                                Text("알림 시간")
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontColor"))
                                Spacer()
                                Text("\(notiTime)")
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontColor"))
                            }
                            Divider()
                            HStack {
                                Text("상세 내용")
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontColor"))
                                Spacer()
                            }
                            HStack {
                                Text("\(challenge.description)")
                                    .lineLimit(8, reservesSpace: true)
                                    .font(.basicFontSmall)
                                    .foregroundColor(Color("FontDescriptionColor"))
                                Spacer()
                            }
                        }
                        .padding(20)
                        .background(Color("CardListColor"))
                        .cornerRadius(8)

                        Image("MoleNoBackground")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 105)
                            .padding(
                                EdgeInsets(
                                    top: 240, leading: 200, bottom: 0,
                                    trailing: 0
                                )
                            )
                    }
                }
                Spacer(minLength: 10)

                Button("도전 시작하기") {
                    challenge.changeStateToDotoOngoing()
                    if let index = challengeLists.toDoChallengesList.firstIndex(where: {$0.id == challenge.id}){
                        challengeLists.toDoChallengesList.remove(at: index)
                        challengeLists.onGoingChallengesList.append(challenge)
                    }
                    onClose()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("CardListColor"))
                .cornerRadius(8)
                Spacer(minLength : 12)
            }
            .padding(20)

        }

    }
}
