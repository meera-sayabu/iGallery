//
//  FullScreenPhotoView.swift
//  iGallery
//
//  Created by MeeraSayabu N on 07/01/24.
//

import CommonUIKit
import Foundation
import SwiftUI

/// A view displaying a photo in full-screen mode using a RemoteImage component.
struct FullScreenPhotoView: View {
    /// The URL of the photo to be displayed.
    let url: URL?

    var body: some View {
        if let photoURL = url {
            RemoteImage(url: photoURL)
                .aspectRatio(contentMode: .fit)
                .navigationBarTitle("", displayMode: .inline)
        }
    }
}

