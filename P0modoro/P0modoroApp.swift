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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timer)
        }
        
        WindowGroup("Personalization", id: "settings-window") {
            SettingsView()
                .environmentObject(timer)
                .frame(minWidth: 400, minHeight: 300)
        }
    }
}
