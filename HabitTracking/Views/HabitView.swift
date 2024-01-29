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
                        refreshStatus()
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
            .onAppear {
                refreshStatus()
            }
        }
    }

    func refreshStatus() {
        guard habit.isTodayComplete == true else { return }
        let now = Date()
        let calendar = Calendar.current
        guard let tomorrow = calendar.date(byAdding: .day, value: 1, to: habit.lastCheckDay) else { return }
        let tomorrowStart = calendar.startOfDay(for: tomorrow)
        let timeInterval = tomorrowStart.timeIntervalSince(now)
        
        let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: false) { _ in
            withAnimation {
                habit.isTodayComplete.toggle()
            }
        }
        RunLoop.main.add(timer, forMode: .common)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Habit.self, configurations: config)
    return HabitView(habit: exampleHabit)
        .modelContainer(container)
}
