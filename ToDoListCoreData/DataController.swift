//
//  DataController.swift
//  ToDoListCoreData
//
//  Created by Tom Huynh on 09/09/2023.
//

import CoreData

struct DataController {
    static let shared = DataController()  // Singleton instance for shared use

    let container: NSPersistentContainer  // Core Data persistent container

    init() {
        container = NSPersistentContainer(name: "TaskDataModel")  // Initialize container with data model
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")  // Handle load failure
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true  // Auto merge changes from parent context
    }
}
