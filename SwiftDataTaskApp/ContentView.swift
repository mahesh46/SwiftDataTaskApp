//
//  ContentView.swift
//  SwiftDataTaskApp
//
//  Created by mahesh lad on 28/07/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext: ModelContext
    @Query private var tasks: [Task]
    
    @State private var newTaskTitle: String = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("New Task", text: $newTaskTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Add Task") {
                let newTask = Task(title: newTaskTitle)
                modelContext.insert(newTask)
                newTaskTitle = ""
                saveContext()
            }
            .padding()
            
            List {
                ForEach(tasks) { task in
                    HStack {
                        Text(task.title)
                        Spacer()
                        Button(action: {
                            task.isCompleted.toggle()
                            saveContext()
                        }) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        }
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        modelContext.delete(tasks[index])
                    }
                    saveContext()
                }
            }
            
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
    
    private func saveContext() {
        do {
            try modelContext.save()
        } catch {
            errorMessage = "Failed to save changes: \(error.localizedDescription)"
        }
    }
}


#Preview {
    ContentView()
}
