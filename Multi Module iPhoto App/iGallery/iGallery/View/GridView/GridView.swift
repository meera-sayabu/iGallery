//
//  GridView.swift
//  iGallery
//
//  Created by MeeraSayabu N on 07/01/24.
//

import CommonUIKit
import Foundation
import SwiftUI

/// A view presenting a grid of photos.
struct GridView: View {
    /// An array of Photo objects representing the photos to be displayed in the grid.
    var photos: [Photo] = []
    
    /// An array of GridItem defining the layout columns for the grid.
    var columns: [GridItem] = []
    
    /// The spacing between grid elements.
    var spacing: CGFloat = 1.0

    var body: some View {
        LazyVGrid(columns: columns, spacing: spacing) {
            ForEach(photos, id: \.self) { image in
                NavigationLink(destination: FullScreenPhotoView(url: image.url)) {
                    RemoteImage(url: image.url)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenWidth / 3)
                        .cornerRadius(2)
                }
            }
        }
    }
}

