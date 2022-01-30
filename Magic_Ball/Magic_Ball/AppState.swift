//
//  AppState.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI

final class AppState: ObservableObject {
   
    @Published var questionText: String = ""
    @Published var currentView: CurrentViewModel = .Main
    @Published var answerText: String = ""
    @Published var arrayOfAllPhrases: [String] = []
    @Published var message: String = ""
    
    @Published var isEditing: EditMode = .inactive
    @Published var switchBetweenEditMode = false
    
    
}

