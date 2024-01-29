//
//  AddView.swift
//  HabitTracking
//
//  Created by M Sapphire on 2024/1/20.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    var onSave: (Habit) -> Void
    @State private var habitName = ""
    @State private var lastDays = 0
    @State private var habitIconIndex = 0
    init(onSave: @escaping (Habit) -> Void) {
        self.onSave = onSave
    }
    
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
                
                Button("save") {
                    let newHabit = Habit(habitName: habitName, lastDays: lastDays, isTodayComplete: false, habitIconIndex: habitIconIndex, lastCheckDay: Date())
                    onSave(newHabit)
                    dismiss()
                }
                .disabled(canSave())
            }
            .navigationTitle("Add habit")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func canSave() -> Bool {
        return habitName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    AddView(onSave: { _ in })
}
