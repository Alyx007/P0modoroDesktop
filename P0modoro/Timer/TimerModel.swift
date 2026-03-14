//
//  TimerModel.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 03/12/25.
//

import Foundation
import Combine
import SwiftUI
import AppKit

enum TimerPhase {
    case idle, work, breaking, paused
}

struct ChecklistItem: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool = false
}

class PomodoroTimer: ObservableObject {

    @Published var workTime: Float = 25.0
    @Published var breakTime: Float = 10.0

    // PERSONALIZATION
    @Published var accentColor: Color = .orange
    @Published var backgroundImage: String = "tom"
    @Published var selectedFont: Font.Design = .rounded

    // CHECKLIST
    @Published var tasks: [ChecklistItem] = []

    // TIMER STATE
    @Published var phase: TimerPhase = .idle
    @Published var secondsRemaining: Int = 0
    @Published var completedPomodoros: Int = 0

    private var tickCancellable: AnyCancellable?
    private var wasWorkPhase = false // tracks what phase was active before pause

    // MARK: - Checklist

    func addTask(_ title: String) {
        let trimmed = String(title.prefix(500))
        tasks.append(ChecklistItem(title: trimmed))
    }

    func toggleTask(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isDone.toggle()
        }
        if !tasks.isEmpty && tasks.allSatisfy({ $0.isDone }) {
            playSound("Purr")
        }
    }

    func removeTask(id: UUID) {
        tasks.removeAll { $0.id == id }
    }

    // MARK: - Computed properties

    var totalSeconds: Int {
        switch phase {
        case .idle:
            return Int(workTime) * 60
        case .work:
            return Int(workTime) * 60
        case .breaking:
            return Int(breakTime) * 60
        case .paused:
            return wasWorkPhase ? Int(workTime) * 60 : Int(breakTime) * 60
        }
    }

    var progress: Double {
        guard totalSeconds > 0 else { return 0 }
        return 1.0 - Double(secondsRemaining) / Double(totalSeconds)
    }

    var displayTime: String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    // MARK: - Controls

    func start() {
        phase = .work
        secondsRemaining = Int(workTime) * 60
        wasWorkPhase = true
        startTicking()
    }

    func pause() {
        wasWorkPhase = (phase == .work)
        phase = .paused
        tickCancellable?.cancel()
    }

    func resume() {
        phase = wasWorkPhase ? .work : .breaking
        startTicking()
    }

    func reset() {
        phase = .idle
        secondsRemaining = 0
        tickCancellable?.cancel()
    }

    // MARK: - Internal

    private func startTicking() {
        tickCancellable?.cancel()
        tickCancellable = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.tick()
            }
    }

    private func playSound(_ name: String) {
        NSSound(named: NSSound.Name(name))?.play()
    }

    private func tick() {
        guard secondsRemaining > 0 else { return }
        secondsRemaining -= 1

        if secondsRemaining == 0 {
            tickCancellable?.cancel()
            if phase == .work {
                completedPomodoros += 1
                phase = .breaking
                secondsRemaining = Int(breakTime) * 60
                playSound("Glass")
                startTicking()
            } else if phase == .breaking {
                phase = .work
                secondsRemaining = Int(workTime) * 60
                playSound("Ping")
                startTicking()
            }
        }
    }
}
