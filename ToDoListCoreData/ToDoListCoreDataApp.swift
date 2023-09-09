//
//  ToDoListCoreDataApp.swift
//  ToDoListCoreData
//
//  Created by Tom Huynh on 09/09/2023.
//

import SwiftUI

@main
struct ToDoListCoreDataApp: App {
    let dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
