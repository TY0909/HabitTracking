//
//  IconGallery.swift
//  HabitTracking
//
//  Created by M Sapphire on 2024/1/20.
//

import SwiftUI

struct IconGalleryView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var iconIndex: Int
    let layout = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    var body: some View {
        NavigationStack {
            LazyVGrid(columns: layout) {
                ForEach(imageGallery, id: \.self) { iconStr in
                    Image(systemName: iconStr)
                        .padding()
                        .onTapGesture {
                            iconIndex = imageGallery.firstIndex(of: iconStr) ?? 0
                            dismiss()
                        }
                }
            }
            .navigationTitle("select icon")
            .navigationBarTitleDisplayMode(.inline)
            
            Spacer()
        }
    }
}

#Preview {
    IconGalleryView(iconIndex: .constant(0))
}
