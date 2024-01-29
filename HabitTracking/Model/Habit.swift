//
//  Habit.swift
//  HabitTracking
//
//  Created by M Sapphire on 2024/1/20.
//

import Foundation
import SwiftData
import SwiftUI

let exampleImage = UIImage(systemName: "questionmark.app")!
let exampleData = exampleImage.pngData()!

@Model
class Habit {
    let id = UUID()
    var habitName: String
    var lastDays: Int
    var isTodayComplete: Bool
    var habitIconIndex: Int
    var lastCheckDay: Date
    
    init(habitName: String, lastDays: Int, isTodayComplete: Bool, habitIconIndex: Int, lastCheckDay: Date) {
        self.habitName = habitName
        self.lastDays = lastDays
        self.isTodayComplete = isTodayComplete
        self.habitIconIndex = habitIconIndex
        self.lastCheckDay = lastCheckDay
    }
}
let imageGallery = [
    "figure.walk",
    "figure.run",
    "figure.cooldown",
    "figure.boxing",
    "figure.flexibility",
    "figure.strengthtraining.functional",
    "figure.jumprope",
    "figure.mind.and.body",
    "figure.outdoor.cycle",
    "figure.pool.swim",
    "book",
    "pencil",
    "bed.double"
]
let exampleHabit = Habit(habitName: "example", lastDays: 5, isTodayComplete: false, habitIconIndex: 0, lastCheckDay: Date())
