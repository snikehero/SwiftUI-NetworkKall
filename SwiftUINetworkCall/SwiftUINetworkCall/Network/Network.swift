//
//  Network.swift
//  SwiftUINetworkCall
//
//  Created by Moises Sanchez on 20/02/24.
//

import Foundation

class NetworkCall {

    func getUser() async throws -> GitHuberUser {
        let endpoint = "https://api.github.com/users/snikehero"
        
        guard let url = URL(string: endpoint) else {
            throw GHError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(GitHuberUser.self, from: data)
        } catch {
            throw GHError.invalidData
        }
        
    }
}


