//
//  TodoRowView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 15/07/2024.
//

import SwiftUI

struct TodoRowView: View {
    var item: TodoItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(1)

                Text(item.date, format: .dateTime.year().month().day().hour().minute())
                    .font(.caption)
                    .foregroundStyle(.gray)
            }

            Spacer()

            ChipView(isCompleted: item.isCompleted)
        }
    }
}

#Preview {
    TodoRowView(item: TodoItem(title: "Testing", date: Date(), isCompleted: true))
}
