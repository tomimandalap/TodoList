//
//  ChipView.swift
//  TodoList
//
//  Created by Tomi Mandala Putra on 15/07/2024.
//

import SwiftUI

struct ChipView: View {
    private var isCompleted: Bool

    private var textTitle: String {
        return isCompleted ? "Completed" : "Pending"
    }

    private var backgroundColor: Color {
        return isCompleted ? .green : .red
    }

    init(isCompleted: Bool) {
        self.isCompleted = isCompleted
    }

    var body: some View {
        Text(textTitle)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .foregroundStyle(.white)
            .background(backgroundColor)
            .cornerRadius(8)
    }
}

#Preview {
    ChipView(isCompleted: true)
}
