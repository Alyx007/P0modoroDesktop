//
//  BreakTimeView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct BreakTimeView: View {
    
    @EnvironmentObject var timer: PomodoroTimer

    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Set your break time")
                    .padding()
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text("Your break time: \(Int(timer.breakTime))")
                    .padding(.horizontal)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                Slider(value: $timer.breakTime,
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
