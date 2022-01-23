//
//  MainView.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI


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
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .center){
                
                //Spacer()
                //Divider()
                questionTextField(isPaddingEnabled: false, textFieldInput: $appState.questionText , navigationText: "Enter your question")
                    .padding(20)
                
                Text(message)
                    .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                        self.message = "Shaken, not stirred."
                    }
                
            }//.background(.black)
            .toolbar {
                ToolbarItem {
                    Button(action: {
                       
                      //  go to settings
                    }) {
                        Image(systemName: "gearshape")
                    
                    }
                }
            }
        }
        
   
        
    }
}


