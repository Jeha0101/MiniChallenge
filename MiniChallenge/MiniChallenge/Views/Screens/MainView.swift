//
//  MainView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct MainView: View {
    @Environment(Coordinator.self) var coordinator
    @Binding var challengeLists: ChallengeLists
    @State private var showPopup = false
    @State private var selectedChallenge: Challenge? = nil

    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    HStack {
                        Button {
                            coordinator.push(.completedChallengs)
                            print("완료한 도전 목록으로 이동")
                        } label: {
                            ChallengeListNavigationView(
                                imageName: "flag.circle",
                                count: challengeLists.completedChallengesList
                                    .count,
                                title: "완료한 도전",
                                colorInside: Color.white,
                                colorStroke: Color(
                                    "StrokeColor"
                                )
                            )
                        }
                        .buttonStyle(.plain)

                        Button {
                            coordinator.push(.toDoChallenges)
                            print("도전 예정 목록으로 이동")
                        } label: {
                            ChallengeListNavigationView(
                                imageName: "stop.circle",
                                count: challengeLists.toDoChallengesList.count,
                                title: "도전 예정",
                                colorInside: Color(
                                    "BoxColor"
                                ),
                                colorStroke: Color(
                                    "BoxColor"
                                )
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    ZStack {
                        VStack {
                            Spacer(
                                minLength: 28
                            )
                            HStack {
                                Text(
                                    "진행 중인 도전"
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
                                        $challengeLists.onGoingChallengesList
                                    ) { $challenge in
                                        challengeRowView(for: challenge)
                                            .onTapGesture {
                                                selectedChallenge = challenge
                                                showPopup = true
                                            }
                                            .swipeActions(edge: .trailing) {
                                                Button {
                                                    //삭제 기능 구현하기
                                                } label: {
                                                    Label(
                                                        "삭제",
                                                        systemImage: "trash"
                                                    )
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
                        Image(
                            "MiniMole"
                        )
                        .resizable()
                        .aspectRatio(
                            contentMode: .fit
                        )
                        .frame(
                            width: 80
                        )
                        .position(
                            x: 330,
                            y: 50
                        )
                    }
                }
                if showPopup, let challenge = selectedChallenge {
                    Color.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showPopup = false
                        }

//                    ChallengeDetailView(
//                        challenge: challenge,
//                        onClose: { showPopup = false }
//                    )
//                    .frame(width: 350, height: 640)  // 원하는 크기
//                    .background(Color("CardBackgroundColor"))
//                    .cornerRadius(20)
                }
            }
            .animation(.easeInOut, value: showPopup)
            .toolbar {
                Button(
                    action: {
                        coordinator
                            .push(
                                .challengeEditor
                            )
                    }) {
                        Text(
                            "새로운 도전 추가"
                        )
                    }
            }
        }
        .padding()
        .background(
            Color(
                "BackgroundColor"
            )
        )
    }

    @ViewBuilder
    func challengeRowView(for challenge: Challenge) -> some View {
        HStack {
            Text(
                challenge.topic
            )
            .font(.system(size: 16))
            Spacer()
            VStack(alignment: .trailing) {
                Text(
                    "도전 종료"
                )
                .font(
                    .system(
                        size: 14
                    )
                )
                Text(
                    "D - \(challenge.dueDate)"
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
