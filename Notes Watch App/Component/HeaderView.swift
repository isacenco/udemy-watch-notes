//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Ghenadie Isacenco on 25/10/2025.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    var title: String = ""
    
    // MARK: - BODY
    var body: some View {
        VStack {
            // TITLE
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // SEPARATOR
            
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule().frame(height: 1)
            } //: HSTACK
            .foregroundColor(.accentColor)
        } //: VSTACK
    }
}


// MARK: - PREVIEW
#Preview("Empty") {
    HeaderView()
}

#Preview("With title") {
    HeaderView(title: "Credits")
}
