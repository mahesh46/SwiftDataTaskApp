//
//  Task.swift
//  SwiftDataTaskApp
//
//  Created by mahesh lad on 28/07/2024.
//

import SwiftData

@Model
final class Task {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
