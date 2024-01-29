//
//  HabitTrackingApp.swift
//  HabitTracking
//
//  Created by M Sapphire on 2024/1/20.
//

import SwiftData
import SwiftUI

@main
struct HabitTrackingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
