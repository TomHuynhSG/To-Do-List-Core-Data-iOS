//
//  ContentView.swift
//  ToDoListCoreData
//
//  Created by Tom Huynh on 09/09/2023.
//


import SwiftUI
import SwiftData
struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Task.name) var tasks: [Task]  // SwiftData @Query for fetching tasks sorted by name
    
    @State private var newTaskName: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Add New Task")) {
                    TextField("Task Name", text: $newTaskName)
                    Button(action: addTask) {
                        Text("Add Task")
                    }
                }
                
                Section(header: Text("Tasks")) {
                    ForEach(tasks) { task in  // No need for id: \.self
                        HStack {
                            Text(task.name)
                            Spacer()
                            Toggle("", isOn: Binding(
                                get: { task.completed },  // Get completion status
                                set: { newValue in  // Update status and save
                                    task.completed = newValue
                                }
                            ))
                        }
                    }
                    .onDelete(perform: deleteTasks)  // Enable task deletion
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    private func addTask() {
        let newTask = Task(name: newTaskName, completed: false)
        modelContext.insert(newTask) // Insert into the context
        newTaskName = ""  // Clear input field after saving
    }
    
    private func deleteTasks(offsets: IndexSet) {
        for index in offsets {
            let task = tasks[index]
            if let taskIndex = tasks.firstIndex(of: task) {
                modelContext.delete(task)
            }
        }
    }
    
}
#Preview {
    ContentView()
        .modelContainer(for: [Task.self])  // Preview with SwiftData container
}



