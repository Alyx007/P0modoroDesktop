//
//  WorkTimeView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct WorkTimeView: View {
    
    @EnvironmentObject var timer: PomodoroTimer
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Set your work time")
                    .padding()
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text("Your work time: \(Int(timer.workTime))")
                    .padding(.horizontal)
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                
                Slider(value: $timer.workTime,
                       in: 20...60,
                       step: 5)
                {
                    Text("Work time")
                } minimumValueLabel: {
                    Text("20")
                        .font(.callout)
                } maximumValueLabel: {
                    Text("60")
                        .font(.callout)
                    
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    WorkTimeView()
        .environmentObject(PomodoroTimer())
}
