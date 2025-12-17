//
//  TimerModel.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 03/12/25.
//

import Foundation
import Combine
import SwiftUI


class PomodoroTimer: ObservableObject { // observableObject is a protoccol that makes SwiftUI observe this class for changes
    
    @Published var workTime: Float = 25.0
    @Published var breakTime: Float = 10.0
    
    // PERSONALIZATION
    @Published var accentColor: Color = .orange
    @Published var backgroundImage: String = "tom"
    @Published var selectedFont: Font.Design = .rounded
}
