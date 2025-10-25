//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Ghenadie Isacenco on 25/10/2025.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    @State private var randomNumber: Int = Int.random(in: 1..<4)
    private var randomImage: String {
        "developer-no\(randomNumber)"
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            // PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            // HEADER
            HeaderView(title: "Credits")
            
            // CONTENT
            Text("Ghenadie Isacenco")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
            
        } //: VSTACK
    }
}

// MARK: - BODY
#Preview {
    CreditsView()
}
