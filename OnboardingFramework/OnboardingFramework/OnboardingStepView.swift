//
//  OnboardingStepView.swift
//  OnboardingFramework
//
//  Created by Kazi Munshimun Nabi on 1/7/25.
//

import SwiftUI

struct OnboardingStepView: View {
    let event: Event
    let namespace: Namespace.ID
    let onInteractionComplete: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            if let title = event.title {
                Text(title)
                    .font(.largeTitle)
                    .modifier(entryAnimationModifier(event.entryAnimation))
                    .matchedGeometryEffect(id: "title-\(event.id)", in: namespace)
                    .foregroundStyle(.secondary)
            }

            if let description = event.description {
                Text(description)
                    .font(.body)
                    .modifier(entryAnimationModifier(event.entryAnimation))
                    .matchedGeometryEffect(id: "desc-\(event.id)", in: namespace)
                    .foregroundStyle(.secondary)
            }

            Spacer()
            
            interactionView
        }
        .transition(exitAnimationTransition(event.exitAnimation))
        .animation(.easeInOut, value: event)
    }

    @ViewBuilder
    var interactionView: some View {
        switch event.userInteraction {
        case .tap:
            Button("Tap to Continue", action: onInteractionComplete)
        case .longPress:
            Text("Long Press to Continue")
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .onLongPressGesture(perform: onInteractionComplete)
        case .none:
            EmptyView()
        }
    }

    func entryAnimationModifier(_ type: EntryAnimation) -> some ViewModifier {
        switch type {
        case .easeInWithCircle:
            return AnyViewModifier(CircleEaseInModifier())
        case .titleOffset:
            return AnyViewModifier(TitleOffsetModifier())
        default:
            return AnyViewModifier(EmptyModifier())
        }
    }

    func exitAnimationTransition(_ type: ExitAnimation) -> AnyTransition {
        switch type {
        case .circleFadeOut:
            return .scale.combined(with: .opacity)
        case .textFadeOut:
            return .opacity
        default:
            return .opacity
        }
    }
}
