//
//  MainView.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI
import CoreData

struct MainView: View {
    
    @ObservedObject var appState: AppState
    @FetchRequest(entity: Phrases.entity(), sortDescriptors: []) var phrase: FetchedResults<Phrases>
    
    var body: some View {
        
        NavigationView() {
            
            VStack(alignment: .center){
                
                questionTextField(isPaddingEnabled: false, textFieldInput: $appState.questionText)
                    .padding(20)
                
                Text(appState.message)
                    .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                        
                        if (appState.questionText != ""){
                            
                            if Reachability.isConnectedToNetwork(){
                                
                                let magicService = JSONparseService()
                                magicService.setAppState(appState: appState)
                                
                                magicService.postGetLoginRequest(completion: {
                                    self.appState.message = self.appState.answerText
                                    self.appState.questionText = ""
                                    
                                })
                            }else{
                                for number in 0 ..< phrase.count{
                                    
                                    appState.arrayOfAllPhrases.append(phrase[number].answer ?? "Unknown")
                                    
                                }
                                self.appState.message = appState.arrayOfAllPhrases.randomElement() ?? "First add some phrases in settings, please"
                                self.appState.questionText = ""
                            }


                        } else {
                            self.appState.message = "Enter your text first!"
                        }
                        
                    }
                
            }
            .toolbar {
                ToolbarItem {
                    SettingsButton(appState: appState)
                }
            }
        }
        
        
        
    }
}


