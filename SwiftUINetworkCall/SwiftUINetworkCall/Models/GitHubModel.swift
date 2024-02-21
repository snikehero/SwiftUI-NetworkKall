//
//  GitHubModel.swift
//  SwiftUINetworkCall
//
//  Created by Moises Sanchez on 20/02/24.
//

import Foundation

struct GitHuberUser: Codable {
    let login: String
    let avatarUrl: String // Doesnt match JSON due to json using snakecase and SwiftUI code is tipically written in camel case
    let bio: String
}
