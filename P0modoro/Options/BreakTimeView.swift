//
//  BreakTimeView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct BreakTimeView: View {
    
    @EnvironmentObject var settings: PomodoroTimer

    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Set your break time")
                    .padding()
                    .font(.title)
                Text("Your break time: \(Int(settings.breakTime)))")
                    .padding(.horizontal)
                    .font(.title3)
                Slider(value: $settings.breakTime,
                       in: 5...45,
                       step: 5)
                {
                    Text("Break time")
                } minimumValueLabel: {
                    Text("5")
                        .font(.callout)
                } maximumValueLabel: {
                    Text("45")
                        .font(.callout)

                }
                .padding()
                
            }
        }
    }
}

#Preview {
    BreakTimeView()
        .environmentObject(PomodoroTimer())
}
