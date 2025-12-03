//
//  TimerModel.swift
//  P0modoro
//
//  Created by Aleksandra Stupiec on 03/12/25.
//

import Foundation
import Combine


class PomodoroTimer: ObservableObject { // observableObject is a protoccol that makes SwiftUI observe this class for changes
    
    @Published var workTime: Float = 25.0
    @Published var breakTime: Float = 10.0
}
