//
//  ContentView.swift
//  iGallery
//
//  Created by MeeraSayabu N on 06/01/24.
//

import CommonUIKit
import NetworkKit
import SwiftUI
import UtilityKit

/// A view representing a grid of photos in an album.
struct PhotoGridContentView: View {

    @StateObject var viewModel: PhotoViewModel
    @State private var gridItemSize: CGFloat = 0
    @State private var columns: [GridItem] = []

    var body: some View {
        NavigationView {
            ScrollView {
                GridView(photos: viewModel.photos ?? [], columns: columns, spacing: 1)
            }
            .navigationTitle("Albums")
        }.navigationTitle("Albums")
            .onAppear {
                gridItemSize = (UIScreen.screenWidth / 3) - 6
                
                columns = [
                    GridItem(.fixed(gridItemSize)),
                    GridItem(.fixed(gridItemSize)),
                    GridItem(.fixed(gridItemSize))
                ]
                
                viewModel.fetchPhotos()
            }
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGridContentView(viewModel: PhotoViewModel(networkService: APINetworkService.shared))
    }
}

#Preview {
    PhotoGridContentView(viewModel: PhotoViewModel(networkService: APINetworkService.shared))
}
