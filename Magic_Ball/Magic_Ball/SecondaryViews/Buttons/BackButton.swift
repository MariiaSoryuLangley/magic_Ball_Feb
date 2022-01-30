//
//  BackButton.swift
//  Magic_Ball
//
//  Created by Mariia on 30.01.2022.
//

import SwiftUI

struct BackButton: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        
        Button {
            withAnimation(.spring()) {
                appState.currentView = .Main
            }
            
        } label: {
            Image(systemName: "chevron.backward")
            Text("Back")
            
        }
        
    }
}
