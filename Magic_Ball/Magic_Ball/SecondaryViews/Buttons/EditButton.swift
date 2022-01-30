//
//  EditButton.swift
//  Magic_Ball
//
//  Created by Mariia on 30.01.2022.
//

import SwiftUI

struct EditButton: View {
 
    @ObservedObject var appState: AppState
    
    var body: some View {
        
        Button(
            action:{
                appState.switchBetweenEditMode.toggle()
                if appState.switchBetweenEditMode{
                    appState.isEditing = .active
                }else{
                    appState.isEditing = .inactive
                }
            }, label: {
                Text("Edit")
                    .padding()
            })
        
    }
}
