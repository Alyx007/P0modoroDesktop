//
//  P0modoroApp.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

@main
struct P0modoroApp: App {

    @StateObject var timer = PomodoroTimer()

    private var isTimerActive: Bool {
        timer.phase != .idle
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timer)
        }
        .defaultSize(width: 700, height: 460)
        .windowResizability(.contentSize)

        MenuBarExtra(isInserted: Binding(
            get: { isTimerActive },
            set: { _ in }
        )) {
            MenuBarView()
                .environmentObject(timer)
        } label: {
            Label(timer.displayTime, systemImage: "clock")
        }
        .menuBarExtraStyle(.window)
    }
}
