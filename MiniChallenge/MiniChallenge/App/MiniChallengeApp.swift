//
//  MiniChallengeApp.swift
//  MiniChallenge
//
//  Created by 제하맥 on 4/16/25.
//

import SwiftUI

@main
struct MiniChallengeApp: App {
    @State var coordinator : Coordinator = Coordinator()
    @State private var challengeLists = ChallengeLists()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.route){
                MainView(challengeLists: $challengeLists)
                    .environment(coordinator)
                    .navigationDestination(for: ViewType.self) { value in
                        switch value {
                        case .main :
                            MainView(challengeLists: $challengeLists)
                                .environment(coordinator)
                        case .challengeEditor :
                            ChallengeEditorView(challengeLists: $challengeLists)
                                .environment(coordinator)
                        case .completedChallengs :
                            CompletedChallengesView(challengeLists: $challengeLists)
                                .environment(coordinator)
                        case .toDoChallenges :
                            ToDoChallegesView(challengeLists: $challengeLists)
                                .environment(coordinator)
                        }
                    }
            }
        }
    }
}
