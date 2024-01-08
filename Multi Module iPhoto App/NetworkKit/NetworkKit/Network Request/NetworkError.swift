//
//  NetworkError.swift
//  NetworkKit
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation

/// An enumeration representing various network-related errors.
enum NetworkError: Error {
    /// The endpoint provided for the network request is invalid.
    case invalidEndpoint
    
    /// No data was received in the network response.
    case noData
    
    /// The URL used in the network request is invalid.
    case invalidURL
}
