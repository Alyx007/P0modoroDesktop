//
//  MenuBarView.swift
//  P0modoro
//

import SwiftUI

struct MenuBarView: View {
    @EnvironmentObject var timer: PomodoroTimer

    private var phaseLabel: String {
        switch timer.phase {
        case .idle:     return "Ready"
        case .work:     return "Round \(timer.completedPomodoros + 1)"
        case .breaking: return "Break"
        case .paused:   return "Paused"
        }
    }

    private var timerDisplay: String {
        if timer.phase == .idle {
            return String(format: "%02d:00", Int(timer.workTime))
        }
        return timer.displayTime
    }

    var body: some View {
        VStack(spacing: 12) {
            Text(phaseLabel)
                .font(.system(.caption, weight: .medium))
                .foregroundColor(.secondary)

            Text(timerDisplay)
                .font(.system(size: 36, weight: .medium, design: .monospaced))
                .monospacedDigit()

            HStack(spacing: 10) {
                switch timer.phase {
                case .idle:
                    Button("Start") { timer.start() }
                        .buttonStyle(TomatoFilledButtonStyle())
                case .work, .breaking:
                    Button("Pause") { timer.pause() }
                        .buttonStyle(TomatoFilledButtonStyle())
                case .paused:
                    Button("Resume") { timer.resume() }
                        .buttonStyle(TomatoFilledButtonStyle())
                }

                Button("Reset") { timer.reset() }
                    .buttonStyle(TomatoOutlinedButtonStyle())
            }

            Divider()

            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
            .buttonStyle(.plain)
            .foregroundColor(.secondary)
            .font(.system(.caption))
        }
        .padding(16)
        .frame(width: 200)
    }
}
