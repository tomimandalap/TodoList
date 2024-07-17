//
//  TodoViewModel.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 15/07/2024.
//

import Foundation

@Observable
class TodoViewModel {
    var todos: [TodoItem] = []

//    init() {
//        let list: [TodoItem] = [
//            TodoItem(title: "Title", date: Date(), isCompleted: false),
//            TodoItem(title: "Title 2", date: Date(), isCompleted: true),
//        ]
//
//        todos = list
//    }

    func createTodo(payloadNewTodo: TodoItem) {
        todos.append(payloadNewTodo)
    }

    func deleteByIndexSet(indexSet: IndexSet) {
        todos.remove(atOffsets: indexSet)
    }
}
