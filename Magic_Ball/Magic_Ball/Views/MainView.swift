//
//  MainView.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI
import CoreData

extension NSNotification.Name {
    public static let deviceDidShakeNotification = NSNotification.Name("MyDeviceDidShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}

struct MainView: View {
    
    @ObservedObject var appState: AppState
    @State private var message = "Unshaken"
//    let container: NSPersistentContainer = NSPersistentContainer(name: "Magic_Ball")
    
   

    
    var body: some View {
        
        
//        let fetchRequest: NSFetchRequest<Item> = Item.fetchRequest()
//        let objects = try viewContext.fetch(fetchRequest)
    
        
     
//
        NavigationView() {
            
            VStack(alignment: .center){
                
                
                //Spacer()
                //Divider()
                questionTextField(isPaddingEnabled: false, textFieldInput: $appState.questionText , navigationText: "Enter your question")
                    .padding(20)
                
                Text(message)
                    .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                        
                        let magicService = JSONparseService()
                        magicService.setAppState(appState: appState)
                        
                        magicService.postGetLoginRequest(completion: {
                            self.message = appState.answerText
                          
                        })
                        
                    }
                   
                
            }//.background(.black)
            .toolbar {
                ToolbarItem {
                    Button {
                        

                        appState.currentView = .Settings
                        print("go to settings")
                        
                    } label: {
                        Image(systemName: "gearshape")
                    
                    }
                }
            }
        }
        
   
        
    }
}


