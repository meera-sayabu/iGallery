//
//  ContentNotAvailableView.swift
//  iGallery
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation
import SwiftUI

/// A view representing a content-not-available message.
struct ContentNotAvailableView: View {
    /// The name of the system image used to represent the content not available.
    var iconName: String
    
    /// The title text describing the content not available.
    var title: String
    
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Content Not Available",
                systemImage: iconName,
                description: Text(title)
            )
            .navigationTitle(title)
        }
    }
}

