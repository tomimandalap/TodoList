//
//  FormEditView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 17/07/2024.
//

import SwiftUI

struct FormEditView: View {
    @Binding var todo: TodoItem

    var body: some View {
        Form {
            HStack {
                Text("Title")

                Spacer()

                TextField("Title", text: $todo.title)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                    .multilineTextAlignment(.trailing)
                    .disabled(true)
            }

            DatePicker("Goal Date", selection: $todo.date, displayedComponents: .date)

            Toggle(isOn: $todo.isCompleted, label: {
                Text("Goal Status")
            })
        }
    }

    private func isFormValid() -> Bool {
        todo.title.isEmpty
    }

    private var bgButtonColor: Color {
        return isFormValid() ? .gray : .blue
    }
}

#Preview {
    FormEditView(todo: .constant(TodoItem(title: "Title Lorem", date: Date(), isCompleted: false)))
}
