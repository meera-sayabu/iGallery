//
//  RemoteImage.swift
//  CommonUIKit
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation
import SwiftUI
import UtilityKit
import NetworkKit

/// A view representing an image loaded from a remote URL.
public struct RemoteImage: View {
    @ObservedObject private var imageLoader: ImageLoader
    private let placeholder: Image

    /// Initializes a RemoteImage view with a URL and an optional placeholder image.
    /// - Parameters:
    ///   - url: The URL from which the image needs to be fetched.
    ///   - placeholder: An optional placeholder Image to display while the remote image is being loaded. Defaults to a system-defined photo icon.
    public init(url: URL?, placeholder: Image = Image(systemName: "photo")) {
        if let _url = url {
            imageLoader = ImageLoader(url: _url, networkService: APINetworkService.shared)
        } else {
            imageLoader = ImageLoader(image: UIImage(systemName: "photo")!)
        }
        self.placeholder = placeholder
    }

    public var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

