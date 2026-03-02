//
//  TimerView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct TimerView: View {

    @EnvironmentObject var timer: PomodoroTimer

    var phaseLabel: String {
        switch timer.phase {
        case .idle: return "Pomodoro Timer"
        case .work: return "Work Time"
        case .breaking: return "Break Time"
        case .paused: return "Paused"
        }
    }

    var body: some View {
        GroupBox {
            VStack(spacing: 12) {
                Text(phaseLabel)
                    .font(.system(.title2, design: timer.selectedFont, weight: .semibold))
                    .foregroundStyle(timer.accentColor)
                    .padding(.top)

                ZStack {
                    ProgressRingView(
                        progress: timer.progress,
                        accentColor: timer.accentColor,
                        lineWidth: 10
                    )

                    if timer.phase == .idle {
                        Text("\(Int(timer.workTime)):00")
                            .font(.system(size: 40, weight: .bold, design: timer.selectedFont))
                            .foregroundStyle(.primary)
                    } else {
                        Text(timer.displayTime)
                            .font(.system(size: 40, weight: .bold, design: timer.selectedFont))
                            .foregroundStyle(.primary)
                            .contentTransition(.numericText())
                    }
                }
                .frame(width: 180, height: 180)

                // Controls
                HStack(spacing: 16) {
                    switch timer.phase {
                    case .idle:
                        Button("Start") {
                            timer.start()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(timer.accentColor)

                    case .work, .breaking:
                        Button("Pause") {
                            timer.pause()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(timer.accentColor)

                        Button("Reset") {
                            timer.reset()
                        }
                        .buttonStyle(.bordered)

                    case .paused:
                        Button("Resume") {
                            timer.resume()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(timer.accentColor)

                        Button("Reset") {
                            timer.reset()
                        }
                        .buttonStyle(.bordered)
                    }
                }
                .padding(.bottom, 4)

                if timer.completedPomodoros > 0 {
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .foregroundStyle(timer.accentColor)
                        Text("\(timer.completedPomodoros)")
                            .font(.system(.body, design: timer.selectedFont, weight: .medium))
                    }
                    .padding(.bottom, 8)
                }
            }
            .padding()
            .frame(minWidth: 250, minHeight: 280)
        }
    }
}

#Preview {
    TimerView()
        .environmentObject(PomodoroTimer())
}
