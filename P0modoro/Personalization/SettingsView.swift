//
//  SettingsView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 16/12/25.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var timer: PomodoroTimer
    
    var body: some View {
        TabView {
            AppearanceView()
        }
    }
}


#Preview {
    SettingsView()
}
