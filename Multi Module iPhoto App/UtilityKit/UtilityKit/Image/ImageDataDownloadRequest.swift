//
//  ImageDataDownloadRequest.swift
//  UtilityKit
//
//  Created by MeeraSayabu N on 08/01/24.
//

import Foundation
import NetworkKit
import UIKit

/// A struct representing a data request specifically for downloading image data.
struct ImageDataDownloadRequest: DataRequest {
    
    /// Headers to be sent along with the request.
    var headers: [String: String] = [:]
    
    /// Query parameters to be included in the request.
    var queryItems: [String: String] = [:]

    /// The URL for the image data download request.
    var url: String
    
    /// The HTTP method used for the image data download request.
    var method: HTTPMethod {
        .get
    }
    
    /// Decodes the received data into a UIImage object.
    /// - Parameter data: The data received from the API response.
    /// - Returns: A UIImage object decoded from the provided data, or nil if the data couldn't be converted to an image.
    /// - Throws: An error if the decoding process encounters an issue.
    func decode(_ data: Data) throws -> UIImage? {
        guard let newImage = UIImage(data: data) else { return nil }
        return newImage
    }
}

