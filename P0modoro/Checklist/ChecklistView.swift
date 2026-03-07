//
//  ChecklistView.swift
//  P0modoro
//

import SwiftUI

struct ChecklistView: View {
    @EnvironmentObject var timer: PomodoroTimer
    @State private var newTaskTitle = ""

    private var pendingTasks: [ChecklistItem] { timer.tasks.filter { !$0.isDone } }
    private var doneTasks: [ChecklistItem]    { timer.tasks.filter { $0.isDone } }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Check list")
                .font(.system(.title2, weight: .bold))
                .foregroundColor(.black)

            // Add row
            HStack(spacing: 8) {
                Button(action: addTask) {
                    AddButtonShape()
                        .stroke(Color.black, style: StrokeStyle(lineWidth: 1.5, lineCap: .round))
                        .frame(width: 24, height: 21)
                }
                .buttonStyle(.plain)

                TextField("Add a task…", text: $newTaskTitle)
                    .frame(maxWidth: .infinity)
                    .onSubmit { addTask() }
            }

            Divider()

            // Task list — fills remaining vertical space
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // To-do section
                    ForEach(pendingTasks) { task in
                        HStack(spacing: 8) {
                            Button {
                                timer.toggleTask(id: task.id)
                            } label: {
                                Image(systemName: "square")
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(.black)

                            Text(task.title)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Button("—") { timer.removeTask(id: task.id) }
                                .buttonStyle(.plain)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 4)
                    }

                    // Divider between sections (only when both non-empty)
                    if !pendingTasks.isEmpty && !doneTasks.isEmpty {
                        Divider().padding(.vertical, 6)
                    }

                    // Done section
                    ForEach(doneTasks) { task in
                        HStack(spacing: 8) {
                            Button {
                                timer.toggleTask(id: task.id)
                            } label: {
                                Image(systemName: "checkmark.square")
                            }
                            .buttonStyle(.plain)
                            .foregroundColor(.black)

                            Text(task.title)
                                .strikethrough()
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            Button("—") { timer.removeTask(id: task.id) }
                                .buttonStyle(.plain)
                                .foregroundColor(.black)
                        }
                        .padding(.vertical, 4)
                    }

                    // Empty state
                    if pendingTasks.isEmpty && doneTasks.isEmpty {
                        Text("No tasks yet")
                            .foregroundColor(.secondary)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 20)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    private func addTask() {
        let title = newTaskTitle.trimmingCharacters(in: .whitespaces)
        guard !title.isEmpty else { return }
        timer.addTask(title)
        newTaskTitle = ""
    }
}

#Preview {
    ChecklistView()
        .environmentObject(PomodoroTimer())
        .frame(width: 320, height: 400)
        .padding()
}
