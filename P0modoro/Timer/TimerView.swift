//
//  TimerView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var timer: PomodoroTimer

    var body: some View {
        GroupBox {
            VStack() {
                Text("Pomodoro Timer")
                    .font(.largeTitle)
                    .padding(.top)
                
                Text("\(Int(timer.workTime)) minutes")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)
                    .padding(.bottom, 10)
                
                Button("Start") {
                                startTimer()
                            }
                
            }
            .padding()
            .frame(minWidth: 250, minHeight: 250)
        }
        
        
    }
    
    func startTimer() {
            print("Starting timer for \(timer.workTime) minutes!")
            //  countdown logic
        }
}


#Preview {
    TimerView()
        .environmentObject(PomodoroTimer())
}
