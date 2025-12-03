//
//  P0modoroApp.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

@main
struct P0modoroApp: App {
    
    @StateObject var settings = PomodoroTimer()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
