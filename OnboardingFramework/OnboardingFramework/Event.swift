//
//  Event.swift
//  OnboardingFramework
//
//  Created by Kazi Munshimun Nabi on 1/7/25.
//

import Foundation

enum UserInteractionType {
    case none
    case tap
    case longPress
}

enum EntryAnimation {
    case easeInWithCircle
    case titleOffset
    case circularProgress0
    case circularProgress50
    // Add more as needed
}

enum ExitAnimation {
    case circleFadeOut
    case textFadeOut
    case circularProgress50
    case circularProgress100
    // Add more as needed
}

struct Event: Identifiable, Equatable {
    let id = UUID()
    let title: String?
    let description: String?
    let userInteraction: UserInteractionType
    let entryAnimation: EntryAnimation
    let exitAnimation: ExitAnimation
    let progress: Int
}
