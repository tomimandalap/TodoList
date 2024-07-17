//
//  CreateTodoView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 16/07/2024.
//

import SwiftUI

struct CreateTodoView: View {
//    var onSubmit() -> Void {}

    var body: some View {
        Form {
            TextField("Title", text: .constant(""))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.words)

            DatePicker("Date", selection: .constant(Date()), displayedComponents: .date)

            Toggle(isOn: .constant(false), label: {
                Text("Status")
            })
        }.toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button(action: {}) {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    CreateTodoView()
}
