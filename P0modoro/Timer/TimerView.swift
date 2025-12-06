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
                
            }
            .padding()
            .frame(minWidth: 250, minHeight: 250)
        }
    }
}


#Preview {
    TimerView()
}
