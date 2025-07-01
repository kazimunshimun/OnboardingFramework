//
//  OnboardingView.swift
//  OnboardingFramework
//
//  Created by Kazi Munshimun Nabi on 1/7/25.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel

    var body: some View {
        ZStack(alignment: .top) {
            Color.white.edgesIgnoringSafeArea(.all)

            ProgressView(value: Double(viewModel.currentEvent.progress), total: 100)
                .padding()

            if !viewModel.isAnimating {
                OnboardingStepView(event: viewModel.currentEvent) {
                    viewModel.handleUserInteraction()
                }
                .id(viewModel.currentEvent.id)
                .padding()
                .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: viewModel.currentStepIndex)
    }
}


#Preview {
    OnboardingView(viewModel: OnboardingViewModel(events: [
        Event(title: "Welcome", description: "Welcome to the app", userInteraction: .none, entryAnimation: .easeInWithCircle, exitAnimation: .circleFadeOut, progress: 0),
        Event(title: "Learn", description: "Learn how to use it", userInteraction: .tap, entryAnimation: .titleOffset, exitAnimation: .textFadeOut, progress: 50),
        Event(title: "Go!", description: "You're ready", userInteraction: .longPress, entryAnimation: .circularProgress0, exitAnimation: .circularProgress100, progress: 100)
    ]))
}
