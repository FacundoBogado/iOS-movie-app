//
//  MovieGenre.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 08/03/2021.
//

import Foundation

public struct MovieGenreResponse: Codable {
    let genres: [MovieGenre]
}

public struct MovieGenre: Codable {
    let id: Int
    let name: String
}
