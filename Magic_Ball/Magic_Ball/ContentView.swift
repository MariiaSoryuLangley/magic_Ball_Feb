//
//  ContentView.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject private var appState = AppState()
    
    var body: some View {
        
        
        if appState.currentView == .Main {
            
            MainView(appState: appState)
            
        } else if appState.currentView == .Settings {
            
            SettingsView(appState: appState)
        }
        
    }
    
}
