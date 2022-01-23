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
        
       MainView(appState: appState)
        
    }

}
