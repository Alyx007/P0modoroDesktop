//
//  ProgressRingView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 01/03/26.
//
// Changing circle implemented

import SwiftUI

struct ProgressRingView: View {

    var progress: Double
    var accentColor: Color
    var lineWidth: CGFloat = 10

    var body: some View {
        ZStack {
            Circle()
                .stroke(accentColor.opacity(0.2), lineWidth: lineWidth)

            Circle()
                .trim(from: 0, to: CGFloat(progress))
                .stroke(accentColor, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 0.3), value: progress)
        }
    }
}

#Preview {
    ProgressRingView(progress: 0.65, accentColor: .white)
        .frame(width: 180, height: 180)
}
