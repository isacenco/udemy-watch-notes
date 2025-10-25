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
        do {
            // 1. Convert the notes array to data using JSONEncoder
            let data = try JSONEncoder().encode(notes)
            
            // 2. Create new URL to save the file using getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. Write data to the given URL
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. Get the notes url path
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                // 2. Create a new property for the data
                let data = try Data(contentsOf: url)
                
                // 3. Decode the data
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // Do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
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
                
                if notes.count >= 1 {
                    
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                                HStack {
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    
                                    Text(notes[i].text)
                                        .lineLimit(1)
                                        .padding(.leading, 5)
                                } //: HSTACK
                            } //: NAVLINK
                        } //: LOOP
                        .onDelete(perform: delete)
                    }//: LIST
                    
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
            } //: VSTACK
            .navigationTitle("Notes")
            .onAppear {
                load()
            }
        }
    }
}


// MARK: - PREVIEW
#Preview {
    ContentView()
}
