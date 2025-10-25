//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Ghenadie Isacenco on 25/10/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var notes: [Note] = []
    @State private var text: String = ""
    
    // MARK: - FUNCTIONS
    func save() {
        dump(notes)
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text:  $text)
                Button {
                    // 1. Only run if not empty
                    guard text.isEmpty == false else { return }
                    
                    // 2. Create new note item with the value
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. Add note item to array with append
                    notes.append(note)
                    
                    // 4. make field empty
                    text = ""
                    
                    // 5. save the notes (function)
                    save()
                    
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                //.buttonStyle(BorderedButtonStyle(tint: .accentColor))
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
                
            } //: HSTACK
            
            Spacer()
            
            Text("Notes: \(notes.count)")
        } //: VSTACK
        .padding()
        .navigationTitle("Notes")
    }
}


// MARK: - PREVIEW
#Preview {
    ContentView()
}
