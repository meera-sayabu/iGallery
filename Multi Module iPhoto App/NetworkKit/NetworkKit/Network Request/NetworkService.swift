//
//  NetworkService.swift
//  NetworkKit
//
//  Created by MeeraSayabu N on 07/01/24.
//

import Foundation


/// A protocol defining a service responsible for making network requests.
public protocol NetworkService {
    /// Makes a network request based on a provided DataRequest and delivers the result in a completion handler.
    /// - Parameters:
    ///   - request: A DataRequest representing the specific request to be executed.
    ///   - completion: A closure that receives a Result object containing either the Response or an Error.
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

/// A concrete implementation of NetworkService tailored for API requests.
public final class APINetworkService: NetworkService {
    
    /// Private initializer to prevent direct initialization of the singleton instance.
    private init() {}
    
    /// The shared instance of the APINetworkService.
    public static let shared = APINetworkService()
    
    /// Executes a network request based on a DataRequest object.
    /// - Parameters:
    ///   - request: A DataRequest representing the specific request to be executed.
    ///   - completion: A closure that receives a Result object containing either the Response or an Error.
    public func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void) {
    
        guard var urlComponent = URLComponents(string: request.url) else {
            let error = NSError(
                domain: NetworkError.invalidEndpoint.localizedDescription,
                code: 404,
                userInfo: nil
            )
            
            return completion(.failure(error))
        }
        
        var queryItems: [URLQueryItem] = []
        
        request.queryItems.forEach {
            let urlQueryItem = URLQueryItem(name: $0.key, value: $0.value)
            urlComponent.queryItems?.append(urlQueryItem)
            queryItems.append(urlQueryItem)
        }
        
        urlComponent.queryItems = queryItems
        
        guard let url = urlComponent.url else {
            let error = NSError(
                domain: NetworkError.invalidEndpoint.localizedDescription,
                code: 404,
                userInfo: nil
            )
            
            return completion(.failure(error))
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                return completion(.failure(error))
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                return completion(.failure(NetworkError.invalidURL))
            }
            
            guard let data = data else {
                return completion(.failure(NetworkError.noData))
            }
            
            DispatchQueue.main.async {
                do {
                    try completion(.success(request.decode(data)))
                } catch let error as NSError {
                    completion(.failure(error))
                }
            }
        }
        .resume()
    }
}
