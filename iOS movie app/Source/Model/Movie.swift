//
//  Movie.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 08/03/2021.
//

import Foundation

public struct MovieViewModel {
    let title: String
    let genre: String
    let poster_path: String
}

public struct Movie: Codable {
    let adult: Bool
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}
