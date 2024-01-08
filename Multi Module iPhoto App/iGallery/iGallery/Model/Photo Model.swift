//
//  Photo Model.swift
//  iGallery
//
//  Created by MeeraSayabu N on 06/01/24.
//

import Foundation

/// A structure representing photo data conforming to Decodable and Hashable protocols.
struct Photo: Decodable, Hashable {
    /// The identifier of the photo.
    var id: String?
    
    /// The author of the photo.
    var author: String?
    
    /// The width of the photo.
    var width: Double?
    
    /// The height of the photo.
    var height: Double?
    
    /// The download URL string for the photo.
    var downloadURL: String?

    private enum CodingKeys: String, CodingKey {
        case downloadURL = "download_url"
    }
}

extension Photo {
    /// A computed property that converts the download URL string to a URL object.
    var url: URL? {
        guard let _downloadURL = downloadURL else {
            return nil
        }
        return URL(string: _downloadURL)
    }
}

