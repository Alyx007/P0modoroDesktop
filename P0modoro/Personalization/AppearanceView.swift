//
//  AppearanceView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 17/12/25.
//

import SwiftUI

struct AppearanceView: View {
    
    @EnvironmentObject var timer: PomodoroTimer
        
        let fontOptions = ["Standard", "Rounded", "Monospaced", "Serif"]
        
        var body: some View {
            Form {
                Section(header: Text("Personalizacja Interfejsu").font(.headline)) {
                    
                    ColorPicker("Kolor główny licznika", selection: $timer.accentColor)
                    
                    Picker("Styl czcionki", selection: $timer.selectedFont) {
                        ForEach(fontOptions, id: \.self) { font in
                            Text(font).tag(font)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Rozmiar").font(.headline)) {
                    Slider(value: .constant(100), in: 50...200) {
                        Text("Skala interfejsu")
                    }
                }
            }
            .formStyle(.grouped)
        }
    }

#Preview {
    AppearanceView()
}
