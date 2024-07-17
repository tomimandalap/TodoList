//
//  TodoListApp.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 15/07/2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    @State private var todoViewModel = TodoViewModel()

    var body: some Scene {
        WindowGroup {
            TodoListView().environment(todoViewModel)
        }
    }
}
