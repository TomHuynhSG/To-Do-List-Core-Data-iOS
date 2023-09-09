//
//  DataController.swift
//  ToDoListCoreData
//
//  Created by Tom Huynh on 09/09/2023.
//

import CoreData

struct DataController {
    static let shared = DataController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "TaskDataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
