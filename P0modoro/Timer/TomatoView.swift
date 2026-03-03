//
//  TomatoView.swift
//  P0modoro
//

import SwiftUI

// MARK: - Button Styles

struct TomatoFilledButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.black)
            .cornerRadius(6)
            .opacity(configuration.isPressed ? 0.75 : 1.0)
    }
}

struct TomatoOutlinedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.black, lineWidth: 1))
            .opacity(configuration.isPressed ? 0.75 : 1.0)
    }
}

// MARK: - TomatoView

struct TomatoView: View {
    @EnvironmentObject var timer: PomodoroTimer

    var timerDisplay: String {
        if timer.phase == .idle {
            return String(format: "%02d:00", Int(timer.workTime))
        }
        return timer.displayTime
    }

    var phaseLabel: String {
        switch timer.phase {
        case .idle:     return "Ready"
        case .work:     return "Round \(timer.completedPomodoros + 1)"
        case .breaking: return "Break"
        case .paused:   return "Paused"
        }
    }

    var primaryButtonTitle: String {
        switch timer.phase {
        case .idle:     return "Start"
        case .work:     return "Pause"
        case .breaking: return "Pause"
        case .paused:   return "Resume"
        }
    }

    func primaryAction() {
        switch timer.phase {
        case .idle:     timer.start()
        case .work:     timer.pause()
        case .breaking: timer.pause()
        case .paused:   timer.resume()
        }
    }

    var body: some View {
        VStack(spacing: 12) {
            Text(timerDisplay)
                .font(.system(size: 56, weight: .medium, design: .monospaced))
                .monospacedDigit()
                .foregroundColor(.black)

            Text(phaseLabel)
                .font(.system(size: 13))
                .foregroundColor(.secondary)

            HStack(spacing: 12) {
                Button(primaryButtonTitle, action: primaryAction)
                    .buttonStyle(TomatoFilledButtonStyle())

                Button("Reset") { timer.reset() }
                    .buttonStyle(TomatoOutlinedButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    TomatoView()
        .environmentObject(PomodoroTimer())
        .frame(width: 360, height: 360)
}
