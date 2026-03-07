//
//  ContentView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var timer: PomodoroTimer
    @State private var showSettings = false

    var body: some View {
        VStack(spacing: 0) {
            // Header bar
            HStack {
                Text("PomidorTime")
                    .font(.system(.title2, design: .serif, weight: .regular))
                    .foregroundStyle(.black)

                Spacer()

                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape")
                        .font(.system(size: 16))
                        .foregroundStyle(.black)
                }
                .buttonStyle(.plain)
                .popover(isPresented: $showSettings) {
                    VStack(spacing: 16) {
                        WorkTimeView()
                        BreakTimeView()
                    }
                    .padding()
                    .frame(minWidth: 300)
                    .environmentObject(timer)
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 12)

            Rectangle()
                .fill(Color.black)
                .frame(height: 1)

            // Two-panel content
            HStack(spacing: 0) {
                TomatoView()
                    .frame(maxWidth: .infinity)
                    .padding(24)

                Divider()

                ChecklistView()
                    .frame(maxWidth: .infinity)
                    .padding(24)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.white)
        .frame(minWidth: 700, minHeight: 460)
    }
}

#Preview {
    ContentView()
        .environmentObject(PomodoroTimer())
}
