//
//  OnboardingViewModel.swift
//  OnboardingFramework
//
//  Created by Kazi Munshimun Nabi on 1/7/25.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    @Published var currentStepIndex: Int = 0
    @Published var events: [Event]
    @Published var isAnimating: Bool = false

    var currentEvent: Event {
        events[currentStepIndex]
    }

    init(events: [Event]) {
        self.events = events
        handleAutoStep()
    }

    func proceedToNextStep() {
        guard currentStepIndex < events.count - 1 else { return }
        isAnimating = true

        // Simulate delay to allow animation out
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.currentStepIndex += 1
            self.isAnimating = false
        }
    }

    func handleUserInteraction() {
        if currentEvent.userInteraction != .none {
            proceedToNextStep()
        }
    }

    private func handleAutoStep() {
        if currentEvent.userInteraction == .none {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                self.proceedToNextStep()
            }
        }
    }
}
