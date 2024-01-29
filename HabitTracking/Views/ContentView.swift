//
//  ContentView.swift
//  HabitTracking
//
//  Created by M Sapphire on 2024/1/20.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var habits: [Habit]
    @State private var showAddAlert = false
    @State private var showEditAlert = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(habits, id: \.id) { habit in
                    HabitView(habit: habit)
                        .swipeActions {
                            Button("Edit") {
                                showEditAlert.toggle()
                            }
                            .tint(.green)
                            
                            Button("delete", role: .destructive) {
                                modelContext.delete(habit)
                            }
                        }
                        .sheet(isPresented: $showEditAlert) {
                            EditView(habit: habit)
                        }
                }
            }
            .navigationTitle("Habit tracking")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("add", systemImage: "plus") {
                    showAddAlert.toggle()
                }
            }
            .sheet(isPresented: $showAddAlert) {
                AddView { newHabit in
                    modelContext.insert(newHabit)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
