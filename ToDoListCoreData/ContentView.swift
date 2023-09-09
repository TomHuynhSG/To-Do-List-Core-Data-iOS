//
//  ContentView.swift
//  ToDoListCoreData
//
//  Created by Tom Huynh on 09/09/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tasks: FetchedResults<Task>
    
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
                        ForEach(tasks, id: \.self) { task in
                            HStack {
                                Text(task.name ?? "")
                                Spacer()
                                Toggle("", isOn: Binding(
                                    get: { task.completed },
                                    set: { newValue in
                                        task.completed = newValue
                                        try? moc.save()
                                    }
                                ))
                            }
                        }
                        .onDelete(perform: deleteTasks)
                    }
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
            }
        }
        
        private func addTask() {
            let newTask = Task(context: moc)
            newTask.name = newTaskName
            newTask.completed = false
            try? moc.save()
            newTaskName = ""
        }
        
        private func deleteTasks(offsets: IndexSet) {
            offsets.map { tasks[$0] }.forEach(moc.delete)
            try? moc.save()
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, DataController.shared.container.viewContext)
    }
}
