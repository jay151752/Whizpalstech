//
//  MockNetworkService.swift
//  WhizpalstechDemoTask
//
//  Created by Jay Ghervada on 31/12/25.
//

import Foundation

class MockNetworkService: NetworkService {
    var responseData: Data?
    var shouldThrowError: Bool = false

    func request<T>(urlString: String, responseType: T.Type) async throws -> T where T : Decodable {
        if shouldThrowError {
            throw URLError(.badServerResponse)
        }
        
        guard let data = responseData else {
            throw URLError(.badServerResponse)
        }
        
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
}
