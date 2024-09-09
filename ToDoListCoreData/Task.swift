//
//  Task.swift
//  ToDoListCoreData
//
//  Created by Tom Huynh on 9/9/24.
//

import Foundation
import SwiftData

@Model
class Task {
    var name: String
    var completed: Bool
    
    init(name: String, completed: Bool = false) {
        self.name = name
        self.completed = completed
    }
}
