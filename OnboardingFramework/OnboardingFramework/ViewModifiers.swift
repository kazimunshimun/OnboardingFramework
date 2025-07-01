//
//  ViewModifiers.swift
//  OnboardingFramework
//
//  Created by Kazi Munshimun Nabi on 1/7/25.
//

import SwiftUI

struct CircleEaseInModifier: ViewModifier {
    @State private var animate = false

    func body(content: Content) -> some View {
        content
            .scaleEffect(animate ? 1.0 : 0.5)
            .opacity(animate ? 1.0 : 0.0)
            .onAppear {
                withAnimation(.easeIn(duration: 0.5)) {
                    animate = true
                }
            }
    }
}

struct TitleOffsetModifier: ViewModifier {
    @State private var animate = false

    func body(content: Content) -> some View {
        content
            .offset(y: animate ? 0 : -30)
            .opacity(animate ? 1.0 : 0.0)
            .onAppear {
                withAnimation(.easeOut(duration: 0.6)) {
                    animate = true
                }
            }
    }
}

struct EmptyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}

struct AnyViewModifier: ViewModifier {
    private let modifierBody: (Content) -> AnyView

    init<M: ViewModifier>(_ modifier: M) {
        self.modifierBody = { content in AnyView(content.modifier(modifier)) }
    }

    func body(content: Content) -> some View {
        modifierBody(content)
    }
}

struct FadeInModifier: ViewModifier {
    @State private var isVisible = false

    func body(content: Content) -> some View {
        content
            .opacity(isVisible ? 1 : 0)
            .onAppear {
                withAnimation(.easeIn(duration: 0.6)) {
                    isVisible = true
                }
            }
    }
}
