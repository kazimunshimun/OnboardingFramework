//
//  OnboardingView.swift
//  OnboardingFramework
//
//  Created by Kazi Munshimun Nabi on 1/7/25.
//

import SwiftUI

struct OnboardingView: View {
    @StateObject var viewModel: OnboardingViewModel
    @Namespace private var animationNamespace

    var body: some View {
        ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(.all)

            ProgressView(value: Double(viewModel.currentEvent.progress), total: 100)
                .padding()
                .matchedGeometryEffect(id: "progress", in: animationNamespace)

            if !viewModel.isAnimating {
                OnboardingStepView(event: viewModel.currentEvent, namespace: animationNamespace) {
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
        Event(title: "First step", description: "Time to start first step", userInteraction: .none, entryAnimation: .easeInWithCircle, exitAnimation: .circleFadeOut, progress: 0),
        Event(title: "Learn", description: "Learn how to use it", userInteraction: .tap, entryAnimation: .titleOffset, exitAnimation: .textFadeOut, progress: 50),
        Event(title: "Go!", description: "You're ready", userInteraction: .longPress, entryAnimation: .circularProgress0, exitAnimation: .circularProgress100, progress: 100)
    ]))
}
