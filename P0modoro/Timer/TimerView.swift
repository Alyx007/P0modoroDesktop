//
//  TimerView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct TimerView: View {
    
    @State private var minutes = 25
    
    var body: some View {
        GroupBox {
            VStack() {
                Text("Pomodoro Timer")
                    .font(.largeTitle)
                    .padding(.top)
                
                Text("\(minutes) min")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundStyle(.primary)
                    .padding(.bottom, 10)
                
                HStack(spacing: 20) {
                    Button("-", action: {
                        if minutes > 5 { minutes -= 5 }
                    })
                    .buttonStyle(.bordered)
                    
                    Button("+", action: {
                        if minutes < 60 { minutes += 5 }
                    })
                    .buttonStyle(.bordered)
                }
                
                HStack() {
                    Button("Start") { print("Start timer") }
                        .buttonStyle(.borderedProminent)
                    
                    Button("Reset") { minutes = 25 }
                        .buttonStyle(.bordered)
                }
                
            }
            .padding()
            .frame(minWidth: 250, minHeight: 250)
        }
    }
}


#Preview {
    TimerView()
}
