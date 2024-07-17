//
//  TodoListView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 15/07/2024.
//

import SwiftUI

struct TodoListView: View {
    @Environment(TodoViewModel.self) var todoVM

    @State private var isCompletedTodos: Bool = false
    @State private var isShowCreateView: Bool = false

    var filterCompletedTodos: [TodoItem] {
        todoVM.todos.filter {
            todo in !isCompletedTodos || todo.isCompleted
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                if todoVM.todos.isEmpty {
                    Text("No todos available")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity)

                } else {
                    Toggle(isOn: $isCompletedTodos) {
                        Text("Filter by completed")
                    }

                    ForEach(filterCompletedTodos, id: \.id) {
                        item in NavigationLink {
                            TodoSummaryView(todo: item)
                        } label: {
                            TodoRowView(item: item)
                        }
                    }.onDelete(perform: { indexSet in
                        todoVM.deleteByIndexSet(indexSet: indexSet)
                    })
                }
            }
            .animation(.default, value: filterCompletedTodos)
            .navigationTitle("Todo List")
            .toolbar {
                Button(action: {
                    isShowCreateView.toggle()
                }, label: {
                    Text("Create")
                })
            }
            .sheet(isPresented: $isShowCreateView, content: {
                FormCreateView()
            })
        } detail: {
            Text("Select item todo")
        }
    }
}

#Preview {
    TodoListView().environment(TodoViewModel())
}
