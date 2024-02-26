//
//  HabitView.swift
//  HabitTracking
//
//  Created by M Sapphire on 2024/1/20.
//

import SwiftData
import SwiftUI

struct HabitView: View {
    var habit: Habit
    
    var body: some View {
        Section {
            HStack(spacing: 20) {
                Image(systemName: imageGallery[habit.habitIconIndex])
                
                VStack {
                    Text(habit.habitName)
                    Text("Last Days: \(habit.lastDays)")
                }
                
                Spacer()
                Button {
                    withAnimation {
                        habit.isTodayComplete.toggle()
                        habit.lastCheckDay = Date()
                        habit.lastDays += 1
                    }
                } label: {
                    Text(habit.isTodayComplete ? "Complete" : "Check")
                        .padding()
                        .background(habit.isTodayComplete ? .gray : .green)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
                .disabled(habit.isTodayComplete)
            }
            .font(.footnote)
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Habit.self, configurations: config)
    return HabitView(habit: exampleHabit)
        .modelContainer(container)
}
