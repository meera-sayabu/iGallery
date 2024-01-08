//
//  ImageLoader.swift
//  UtilityKit
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation
import SwiftUI
import NetworkKit

/// A class responsible for loading images asynchronously from a URL using a provided network service.
public class ImageLoader: ObservableObject {
    
    /// Published property to track changes in the loaded image.
    @Published public var image: UIImage?
    
    /// NSCache used for caching images based on their URL strings.
    private let cache = NSCache<NSString, UIImage>()
    
    /// The URL for the image loading request.
    private let url: URL?
    
    /// The network service responsible for fetching the image.
    private let networkService: NetworkService?
    
    /// Initializes the ImageLoader with a URL and a network service to load the image.
    /// - Parameters:
    ///   - url: The URL from which the image needs to be fetched.
    ///   - networkService: The service used to make network requests.
    public init(url: URL, networkService: NetworkService) {
        self.url = url
        self.networkService = networkService
        loadImage() // Initiates the image loading process
    }
    
    /// Initializes the ImageLoader with a preloaded image.
    /// - Parameter image: The preloaded UIImage object.
    public init(image: UIImage) {
        self.image = image
        url = nil
        networkService = nil
    }
    
    /// Initiates the asynchronous process of loading an image from the specified URL.
    private func loadImage() {
        // Check if the image for the URL exists in the cache
        if let _url = url, let cachedImage = cache.object(forKey: _url.absoluteString as NSString) {
            image = cachedImage // Use the cached image if available
            return
        }
        
        // If the image is not cached, initiate a network request to fetch it
        let request = ImageDataDownloadRequest(url: url!.absoluteString)
        networkService?.request(request) { [weak self] result in
            switch result {
            case let .success(image): // If the request succeeds, update the image
                DispatchQueue.main.async {
                    self?.image = image
                }
            case let .failure(error): // If the request fails, print the error
                print("Error", error.localizedDescription)
            }
        }
    }
}

