//
//  ContentView.swift
//  ModalViews
//
//  Created by Abdalla Mohammed on 3/23/25.
//
import SwiftUI

/**
 A SwiftUI view that provides a modal overlay supporting custom content.
 
 The `ModalSupportView` wraps your content with a dimmed background and handles dismissal when the background is tapped.
 
 - Parameters:
    - showModal: A binding Boolean that indicates whether the modal should be shown.
    - content: A view builder that provides the content to display as a modal.
 */

struct ModalSupportView<Content: View>: View {
    
    @Binding var showModal: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if showModal {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .transition(AnyTransition.opacity.animation(.smooth))
                    .onTapGesture {
                        showModal = false
                    }
                    .zIndex(1)
                
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .zIndex(2)
            }
        }
        .zIndex(999)
        .animation(.bouncy, value: showModal)
    }
}

/**
 A view extension to simplify presenting modal content.
 
 This extension overlays the invoking view with a `ModalSupportView`, allowing you to present any custom modal content.
 
 - Parameters:
    - showModal: A binding to a Boolean value that determines whether the modal is visible.
    - content: A closure that returns the view to be displayed as a modal.
 */
extension View {
    func showModal(showModal: Binding<Bool>, @ViewBuilder content: () -> some View) -> some View {
        self
            .overlay(
                ModalSupportView(showModal: showModal) {
                    content()
                }
            )
    }
}

private struct PreviewView: View {
    
    @State private var showModal: Bool = false
    
    var body: some View {
        Button("Click me") {
            showModal = true
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .showModal(showModal: $showModal) {
            Circle()
                .padding(40)
                .padding(.vertical, 100)
                .onTapGesture {
                    showModal = false
                }
                .transition(.move(edge: .top))
        }
    }
}

#Preview {
    PreviewView()
}
