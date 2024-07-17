//
//  CreateTodoView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 16/07/2024.
//

import SwiftUI

struct FormCreateView: View {
    @Environment(\.dismiss) var dismiss

    @Environment(TodoViewModel.self) var todoVM

    @State private var _title: String = ""
    @State private var _date: Date = .init()

    var body: some View {
        Form {
            Text("Create New Todo")
                .font(.title3)
                .fontWeight(.medium)

            HStack {
                Text("Title")

                Spacer()

                TextField("Title", text: $_title)
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.words)
                    .multilineTextAlignment(.trailing)
                    
            }

            DatePicker("Goal Date", selection: $_date, in: Date()..., displayedComponents: .date)

            HStack {
                Spacer()

                Button(action: onSubmitForm) {
                    Text("Create")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .foregroundStyle(.white)
                        .background(bgButtonColor)
                        .cornerRadius(8)
                }.disabled(isFormValid())
            }
        }
    }

    private func isFormValid() -> Bool {
        _title.isEmpty
    }

    private var bgButtonColor: Color {
        return isFormValid() ? .gray : .blue
    }

    private func onSubmitForm() {
        let newTodoItem = TodoItem(title: _title, date: _date, isCompleted: false)
        todoVM.createTodo(payloadNewTodo: newTodoItem)

        // close pop sheet
        dismiss()
    }
}

#Preview {
    FormCreateView().environment(TodoViewModel())
}
