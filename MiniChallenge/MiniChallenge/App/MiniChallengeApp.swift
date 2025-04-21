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
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.route){
                MainView()
                    .environment(coordinator)
                    .navigationDestination(for: ViewType.self) { value in
                        switch value {
                        case .main :
                            MainView()
                                .environment(coordinator)
                        case .challengeEditor :
                            ChallengeEditorView()
                                .environment(coordinator)
                        case .completedChallengs :
                            CompletedChallengesView()
                                .environment(coordinator)
                        case .toDoChallenges :
                            ToDoChallegesView()
                                .environment(coordinator)
                        }
                    }
            }
        }
    }
}
