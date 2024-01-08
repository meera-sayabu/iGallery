//
//  DataRequest.swift
//  NetworkKit
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation

/// A protocol defining the structure for a data request used in networking.
public protocol DataRequest {
    /// The associated type representing the response expected from the request.
    associatedtype Response
    
    /// The URL for the data request.
    var url: String { get }
    
    /// The HTTP method for the data request.
    var method: HTTPMethod { get }
    
    /// The headers to be included in the request.
    var headers: [String: String] { get }
    
    /// The query items or parameters to be included in the request.
    var queryItems: [String: String] { get }
    
    /// Decodes the received data into the associated Response type.
    /// - Parameter data: The data received from the API response.
    /// - Returns: The decoded Response object.
    /// - Throws: An error if the decoding process encounters an issue.
    func decode(_ data: Data) throws -> Response
}

extension DataRequest where Response: Decodable {
    /// Default implementation for decoding the received data into a Decodable Response type.
    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        return try decoder.decode(Response.self, from: data)
    }
}

extension DataRequest {
    /// Default implementation for providing empty headers.
    var headers: [String: String] {
        [:]
    }
    
    /// Default implementation for providing empty query items.
    var queryItems: [String: String] {
        [:]
    }
}

