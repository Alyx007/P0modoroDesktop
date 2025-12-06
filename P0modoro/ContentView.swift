//
//  ContentView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
        Image("tom")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
        
            HStack() {
                
                VStack(spacing: 8) {
                    WorkTimeView()
                        .padding(.horizontal, 8)
                    BreakTimeView()
                        .padding(.horizontal, 8)
                    
                }
                VStack {
                    PersonalizationView()
                    TimerView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(PomodoroTimer())

}
