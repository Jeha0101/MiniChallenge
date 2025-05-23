//
//  ChallengeEditorView.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

struct ChallengeEditorView: View {
    @Environment(Coordinator.self) var coordinator
    @Binding var challengeLists : ChallengeLists
    @State var challenge: Challenge = Challenge()
    
    var isAllFilled: Bool {
        challenge.topic.count * challenge.description.count != 0
    }

    var body: some View {
        Form {
            Section("도전 주제") {
                TextField(
                    "무엇에 도전하는지 작성하세요",
                    text: $challenge.topic
                )
            }

            Section {
                Picker("소요시간", selection: $challenge.duration) {
                    ForEach(DurationType.allCases) { type in
                        Text("\(type.displayName)")
                            .tag(type)

                    }
                }
                .pickerStyle(.menu)
            }

            Section {
                Toggle(isOn: $challenge.isNotiEnabled) {
                    Text("알림 수신")
                }
                if challenge.isNotiEnabled {
                    DatePicker(
                        "시간", selection: $challenge.notiTime,
                        displayedComponents: .hourAndMinute)
                }

            }

            Section {
                TextField(
                    "도전에 대한 상세한 내용을 작성해주세요",
                    text: $challenge.description,
                    axis: .vertical
                )
                .lineLimit(8, reservesSpace: true)
            }
        }
        .scrollContentBackground(.hidden)
        .padding(0)
        .background(
            Color("BackgroundColor")
        )
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: navigationBarCustomBackButton,
            trailing: navigationBarCustomDoneButton)
    }

    var navigationBarCustomBackButton: some View {
        Button {
            coordinator.pop()
        } label: {
            HStack {
                Image(systemName: "chevron.left")
                    .aspectRatio(contentMode: .fit)
                Text("이전")
            }
        }
    }

    var navigationBarCustomDoneButton: some View {
        Button {
            challengeLists.toDoChallengesList.append(challenge)
            coordinator.push(.toDoChallenges)
        } label: {
            Text("저장")
        }
        .disabled(!isAllFilled)
    }
}
