//
//  WorkTimeView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct WorkTimeView: View {
    
    @State public var workTime: Float = 25
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                Text("Set your work time")
                    .padding()
                    .font(.title)
                Text("Your work time: \(Int(workTime))")
                    .padding(.horizontal)
                    .font(.title3)
                Slider(value: $workTime,
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
}
