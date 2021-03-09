//
//  MovieAPI.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 06/03/2021.
//

import UIKit

public struct MovieAPI {
    typealias Strings = CommonStrings.MovieApi
}

public struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let total_pages: Int
    let total_results: Int
}
