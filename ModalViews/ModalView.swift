//
//  ModalView.swift
//  ModalViews
//
//  Created by Abdalla Mohammed on 3/23/25.
//

import SwiftUI

/**
 A SwiftUI view that displays a modal with an optional image and textual content.
 
 The `ModalView` renders an image (if provided), a title, subtitle, and headline in a vertically arranged layout.
 It also includes a close button in the top-right corner that executes a closure when tapped.
 
 - Parameters:
    - imageName: An optional system image name to display. Defaults to "heart.fill".
    - title: An optional title text. Defaults to "Alpha".
    - subtitle: An optional subtitle text. Defaults to "Alien".
    - headline: An optional headline text. Defaults to "An Allien in the park".
    - onXMarkTap: A closure that is triggered when the close button is tapped.
**/

struct ModalView: View {
    
    var imageName: String? = "heart.fill"
    var title: String? = "Alpha"
    var subtitle: String? = "Alien"
    var headline: String? = "An Allien in the park"
    var onXMarkTap: () -> Void = { }
    
    var body: some View {
        VStack(spacing: 0) {
            if let imageName {
                Image(systemName: imageName)
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200)
                    .padding()
            }
            VStack(alignment: .leading, spacing: 4) {
                if let title {
                    Text(title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                if let subtitle {
                    Text(subtitle)
                        .font(.title3)
                        .foregroundStyle(.secondary)
                }
                if let headline {
                    Text(headline)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
                
            }
            .padding(24)
            .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .background(.thinMaterial)
        .cornerRadius(14)
        
        .overlay(
            Button(action: {
                onXMarkTap()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .foregroundStyle(Color.black)
                    .padding(4)
                    .padding(8)
            })
            , alignment: .topTrailing
        )
    }
}

#Preview {
    ZStack {
        ModalView()
            .padding(40)
    }
}
