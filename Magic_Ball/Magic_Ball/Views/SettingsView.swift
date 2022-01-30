//
//  SettingsView.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI
import CoreData

struct SettingsView: View {
    
    @ObservedObject var appState: AppState
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Phrases.row, ascending: true)],
                  animation: .default)
    private var myPhrases: FetchedResults<Phrases>
    
    @State var phrasesTextField = String()
    
    var body: some View {
        
        NavigationView {

            List{
                
                TextField("Enter Phrase", text: $phrasesTextField, onCommit: {
                    
                    if phrasesTextField != "" {
                        let phraseToSave = Phrases(context: viewContext)
                        phraseToSave.id = UUID()
                        phraseToSave.answer = "\(phrasesTextField)"
                        phraseToSave.row = (myPhrases.last?.row ?? 0) + 1
                        
                        try? self.viewContext.save()
                        phrasesTextField = ""
                    }
                    
                }).padding(10)
                    .font(.system(size: 20))
                    .border(Color.black)
                
                ForEach(myPhrases, id: \.id) { addToList in
                    
                    Text("\(addToList.answer ?? "Unknown")")
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
                .font(.system(size: 20 ))
                
            }
            .environment(\.editMode, .constant(appState.isEditing))
            .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        EditButton(appState: appState)
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                       
                        
                        BackButton(appState: appState)
                    }
                }

            Text("Select an item")
        }
        
    }
    private func delete(at offsets: IndexSet){
        
        for offset in offsets{
            let phrasesText = myPhrases[offset]
            viewContext.delete(phrasesText)
            saveData()
        }
    }
    
    private func saveData(){
        try? self.viewContext.save()
    }
    
    private func move(from source: IndexSet, to destination: Int){
        
        if source.first! > destination{
            myPhrases[source.first!].row = myPhrases[destination].row - 1
            
            for i in destination...myPhrases.count - 1{
                myPhrases[i].row = myPhrases[i].row + 1
            }
            
        }
        
        if source.first! < destination{
            myPhrases[source.first!].row = myPhrases[destination - 1].row + 1
            
            for i in 0...destination - 1{
                myPhrases[i].row = myPhrases[i].row - 1
            }
        }
        saveData()
    }
    
}

