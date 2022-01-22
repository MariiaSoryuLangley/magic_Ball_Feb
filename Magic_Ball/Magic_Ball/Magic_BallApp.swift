//
//  Magic_BallApp.swift
//  Magic_Ball
//
//  Created by Mariia on 21.01.2022.
//

import SwiftUI

@main
struct Magic_BallApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
