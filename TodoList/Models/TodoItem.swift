//
//  TodoItem.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 15/07/2024.
//

import Foundation

struct TodoItem: Identifiable, Hashable {
    var id = UUID()
    var title: String
    var date: Date
    var isCompleted: Bool
}
