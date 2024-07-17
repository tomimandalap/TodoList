//
//  TodoDetailView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 17/07/2024.
//

import SwiftUI

struct TodoDetailView: View {
    var item: TodoItem

    var body: some View {
        List {
            Text(item.title)
                .font(.title2)
                .fontWeight(.semibold)

            HStack {
                Text("Goal Date")
                Spacer()
                Text(item.date, format: .dateTime.year().month().day())
            }

            HStack {
                Text("Status")
                Spacer()
                ChipView(isCompleted: item.isCompleted)
            }
        }
    }
}

#Preview {
    TodoDetailView(item: TodoItem(title: "Title", date: Date(), isCompleted: false))
}
