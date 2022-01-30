//
//  SettingsButton.swift
//  Magic_Ball
//
//  Created by Mariia on 30.01.2022.
//

import SwiftUI

struct SettingsButton: View {
    
    @ObservedObject var appState: AppState
    
    var body: some View {
        
        VStack{
            
            Button {
                withAnimation(.spring()) {
                    appState.currentView = .Settings
                }
                
            } label: {
                Image(systemName: "gearshape")
                
            }
            
        }
    }
}
