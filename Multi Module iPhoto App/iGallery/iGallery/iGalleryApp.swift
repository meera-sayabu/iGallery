//
//  iGalleryApp.swift
//  iGallery
//
//  Created by MeeraSayabu N on 06/01/24.
//

import SwiftUI
import NetworkKit

/// The main structure defining the iGallery application.
@main
struct iGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                // Displays a grid of photos using PhotoGridContentView
                PhotoGridContentView(viewModel: PhotoViewModel(networkService: APINetworkService.shared))
                    .tabItem {
                        Label(Constants.library.0, systemImage: Constants.library.1)
                    }
                
                // Displays a content-not-available view for the "For You" section
                ContentNotAvailableView(iconName: Constants.forYou.1, title: Constants.forYou.0)
                    .tabItem {
                        Label(Constants.forYou.0, systemImage: Constants.forYou.1)
                    }
                
                // Displays a content-not-available view for the Albums section
                ContentNotAvailableView(iconName: Constants.albums.1, title: Constants.albums.0)
                    .tabItem {
                        Label(Constants.albums.0, systemImage: Constants.albums.1)
                    }
                
                // Displays a content-not-available view for the Search section
                ContentNotAvailableView(iconName: Constants.search.1, title: Constants.search.0)
                    .tabItem {
                        Label(Constants.search.0, systemImage: Constants.search.1)
                    }
            }
        }
    }
}
