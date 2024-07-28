//
//  SwiftDataTaskAppApp.swift
//  SwiftDataTaskApp
//
//  Created by mahesh lad on 28/07/2024.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataTaskAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Task.self)
        }
    }
}
