//
//  TodoChallegesView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct ToDoChallegesView: View {
    @Environment(Coordinator.self) var coordinator
    @Binding var challengeLists: ChallengeLists
    @State private var showPopup = false
    @State private var selectedChallenge: Challenge = Challenge()

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    VStack {
                        HStack {
                            Text(
                                "도전 예정"
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
                        ZStack {
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
                            List {
                                ForEach(
                                    $challengeLists.toDoChallengesList
                                ) { $challenge in
                                    challengeRowView(for: challenge)
                                        .onTapGesture {
                                            selectedChallenge = challenge
                                            showPopup = true
                                        }
                                        .swipeActions(edge: .trailing) {
                                            Button(role: .destructive) {
                                                if let index = challengeLists
                                                    .toDoChallengesList
                                                    .firstIndex(where: {
                                                        $0.id == challenge.id
                                                    })
                                                {
                                                    challengeLists
                                                        .toDoChallengesList
                                                        .remove(at: index)
                                                }
                                            } label: {
                                                Label(
                                                    "삭제", systemImage: "trash")
                                            }
                                            Button {
                                                //편집 기능 구현
                                            } label: {
                                                Label(
                                                    "편집",
                                                    systemImage: "pencil.line")
                                            }
                                        }
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
            
            
            if showPopup, selectedChallenge != nil {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showPopup = false
                    }

                ChallengeDetailView(
                    challengeLists: $challengeLists,
                    challenge: $selectedChallenge,
                    onClose: { showPopup = false }
                )
                .frame(width: 350, height: 700)
                .background(Color("CardBackgroundColor"))
                .cornerRadius(20)
            }
        }
    }

    var navigationBarCustomBackButton: some View {
        Button {
            coordinator.popToRoot()
        } label: {
            HStack {                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                Text("이전")
            }
        }
    }

    @ViewBuilder
    func challengeRowView(for challenge: Challenge) -> some View {
        HStack {
            Text(
                challenge.topic
            )
            .font(
                .system(
                    size: 16
                )
            )
            Spacer()
            VStack(alignment: .trailing) {
                Text(
                    "도전 소요 시간"
                )
                .font(
                    .system(
                        size: 10
                    )
                )
                Text(
                    challenge.duration.displayName
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
                lineWidth: 1
            )
        )
    }
}

//#Preview{
//    ToDoChallegesView()
//        .environment(Coordinator())
//}
