//
//  ToDoListCoreDataApp.swift
//  ToDoListCoreData
//
//  Created by Tom Huynh on 09/09/2023.
//

import SwiftUI
import SwiftData


@main
struct ToDoListCoreDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Task.self])  // Add the SwiftData container for Task model
        }
    }
}

