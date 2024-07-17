//
//  TodoSummaryView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 16/07/2024.
//

import SwiftUI

struct TodoSummaryView: View {
    @Environment(\.editMode) var editMode
    @Environment(TodoViewModel.self) var todoVM

    var todo: TodoItem
    @State private var drafTodo: TodoItem

    init(todo: TodoItem) {
        self.todo = todo
        self.drafTodo = todo
    }

    var body: some View {
        VStack {
            if editMode?.wrappedValue == .inactive {
                TodoDetailView(item: todo)
            } else {
                FormEditView(todo: $drafTodo).onAppear {
                    drafTodo = todo
                }.onDisappear {
                    if let index = todoVM.todos.firstIndex(where: { $0.id == todo.id }) {
                        todoVM.todos[index] = drafTodo
                    }
                }
            }
        }
        .toolbar {
            if editMode?.wrappedValue == .active {
                Button("Cancel", role: .cancel) {
                    // for reassign value drafTodo when click cancel
                    drafTodo = todo

                    // set wrappedValue
                    editMode?.animation().wrappedValue = .inactive
                }
            }

            EditButton()
        }
    }
}

#Preview {
    NavigationSplitView {
        TodoSummaryView(todo: TodoItem(title: "Title", date: Date(), isCompleted: false))
            .environment(TodoViewModel())
    } detail: {
        Text("Detaul")
    }
}
