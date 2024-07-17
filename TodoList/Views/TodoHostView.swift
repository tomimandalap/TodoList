//
//  TodoHostView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 16/07/2024.
//

import SwiftUI

struct TodoHostView: View {
    @Environment(\.editMode) var editMode

    @Environment(TodoViewModel.self) var todoVM

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        editMode?.animation().wrappedValue = .inactive
                    }
                }

                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                TodoSummaryView(todo: todoVM.todos[0])
            } else {
                Text("HOOO")
            }
        }.padding()
    }
}

#Preview {
    TodoHostView().environment(TodoViewModel())
}
