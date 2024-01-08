//
//  PhotoViewModel.swift
//  iGallery
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation
import NetworkKit
import SwiftUI

/// An observable view model responsible for handling photo data.
@MainActor
class PhotoViewModel: ObservableObject {
    /// Published property holding an array of Photo objects.
    @Published var photos: [Photo]?

    /// The network service used for fetching photo data.
    private let networkService: NetworkService

    /// Initializes the PhotoViewModel with a network service.
    /// - Parameter networkService: The network service responsible for fetching photo data.
    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    /// Fetches photos from the network using a predefined request.
    func fetchPhotos() {
        let request = PhotoRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case let .success(photos):
                self?.photos = photos
            case let .failure(error):
                self?.photos = []
                print("Error", error.localizedDescription)
            }
        }
    }
}

