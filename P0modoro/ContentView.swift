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
        Image("tom0")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .edgesIgnoringSafeArea(.all)
        
        
            HStack(spacing: 200) {
                
                VStack(spacing: 8) {
                    WorkTimeView()
                        .padding(.horizontal, 8)
                    BreakTimeView()
                        .padding(.horizontal, 8)
                    
                }
                
                
                TimerView()
            }
        }
    }
}

#Preview {
    ContentView()
}
