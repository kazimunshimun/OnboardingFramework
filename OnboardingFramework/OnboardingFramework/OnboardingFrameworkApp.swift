//
//  OnboardingFrameworkApp.swift
//  OnboardingFramework
//
//  Created by Kazi Munshimun Nabi on 1/7/25.
//

import SwiftUI

@main
struct OnboardingFrameworkApp: App {
    let events: [Event] = [
        Event(title: "Welcome", description: "Welcome to the app", userInteraction: .none, entryAnimation: .easeInWithCircle, exitAnimation: .circleFadeOut, progress: 0),
        Event(title: "Learn", description: "Learn how to use it", userInteraction: .tap, entryAnimation: .titleOffset, exitAnimation: .textFadeOut, progress: 50),
        Event(title: "Go!", description: "You're ready", userInteraction: .longPress, entryAnimation: .circularProgress0, exitAnimation: .circularProgress100, progress: 100)
    ]

    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel(events: events))
        }
    }
}
