//
//  WorkTimeView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct WorkTimeView: View {

    @EnvironmentObject var timer: PomodoroTimer

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Work")
                    .font(.system(.body, design: .serif))
                    .foregroundColor(.primary)
                Spacer()
                Text("\(Int(timer.workTime)) min")
                    .font(.system(.body, design: .monospaced))
                    .foregroundColor(.secondary)
            }

            Slider(value: $timer.workTime, in: 20...60, step: 5)
                .tint(.black)
        }
        .disabled(timer.phase != .idle)
        .opacity(timer.phase != .idle ? 0.5 : 1.0)
    }
}

#Preview {
    WorkTimeView()
        .environmentObject(PomodoroTimer())
        .padding()
        .frame(width: 300)
}
