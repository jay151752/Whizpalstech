//
//  NetworkManager.swift
//  WhizpalstechDemoTask
//
//  Created by Jay Ghervada on 30/12/25.
//

import Foundation

    //Error handling
enum NetworkError: Error, LocalizedError {
    case badURL
    case serverError(statusCode: Int)
    case decodingError(Error)
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Invalid URL."
        case .serverError(let statusCode):
            return "Server returned an error with status code \(statusCode)."
        case .decodingError(let error):
            return "Failed to decode data: \(error.localizedDescription)"
        case .unknown(let error):
            return "Unknown error occurred: \(error.localizedDescription)"
        }
    }
}

//Protocol for dependency injection
protocol NetworkService {
    func request<T: Decodable>(urlString: String, responseType: T.Type) async throws -> T
}

//Network Manager Class
class NetworkManager: NetworkService {
    
    static let shared = NetworkManager()
    private init() {}
    
    func request<T: Decodable>(urlString: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw NetworkError.badURL
        }
        
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpRes = response as? HTTPURLResponse else {
                throw NetworkError.unknown(URLError(.badServerResponse))
            }
            
            guard (200...299).contains(httpRes.statusCode) else {
                throw NetworkError.serverError(statusCode: httpRes.statusCode)
            }
            
            do {
                let decodedValue = try JSONDecoder().decode(T.self, from: data)
                return decodedValue
            } catch {
                throw NetworkError.decodingError(error)
            }
            
        } catch let error as NetworkError {
            throw error
        } catch {
            throw NetworkError.unknown(error)
        }
    }
}

