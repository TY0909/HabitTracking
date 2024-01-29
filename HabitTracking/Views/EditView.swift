//
//  EditView.swift
//  HabitTracking
//
//  Created by M Sapphire on 2024/1/20.
//

import SwiftData
import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @Bindable var habit: Habit
    @State private var habitName = ""
    @State private var lastDays = 0
    @State private var habitIconIndex = 0
    
    var body: some View {
        NavigationStack {
            List {
                Section("Habit name") {
                    TextField("Enter your name", text: $habitName)
                }
                Section("Already Last days") {
                    TextField("Enter last days", value: $lastDays, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section("Select icon") {
                    NavigationLink {
                        IconGalleryView(iconIndex: $habitIconIndex)
                    } label: {
                        HStack {
                            Text("Select Icon")
                            Spacer()
                            Image(systemName: imageGallery[habitIconIndex])
                        }
                    }
                }
                
                Button("Save") {
                    updateHabit()
                    dismiss()
                }
                .disabled(canSave())
            }
            .navigationTitle("Add habit")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                initialize()
            }
        }
    }
    
    func canSave() -> Bool {
        return habit.habitName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func initialize() {
        self.habitName = habit.habitName
        self.lastDays = habit.lastDays
        self.habitIconIndex = habit.habitIconIndex
    }
    
    func updateHabit() {
        habit.habitName = habitName
        habit.lastDays = lastDays
        habit.habitIconIndex = habitIconIndex
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Habit.self, configurations: config)
    return EditView(habit: exampleHabit)
        .modelContainer(container)
}
