//
//  TimerView.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 19/11/25.
//

import SwiftUI

struct TimerView: View {
    
    @State private var time = Date()
    let timeRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(hour: 0, minute: 20, second: 0)
        let endComponents = DateComponents(hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
        ...
        calendar.date(from:endComponents)!
    }()
    
    var body: some View {
        VStack {
            Text("Set your time")
                .padding(.horizontal)
            
            DatePicker(
                "",
                selection: $time,
                in: timeRange,
                displayedComponents: [.hourAndMinute]
            )
            .padding()
            .datePickerStyle(.graphical)
            .labelsHidden()
        }
    }
}

#Preview {
    TimerView()
}
