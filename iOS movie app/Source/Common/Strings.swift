//
//  Strings.swift
//  iOS movie app
//
//  Created by Facundo Bogado on 06/03/2021.
//

import Foundation

public struct CommonStrings {
    
    public struct MovieApi {
        static let baseURL = "https://api.themoviedb.org/3/"
        static let allMoviesURL = "movie/popular?api_key=208ca80d1e219453796a7f9792d16776"
        static let imageURL = "https://image.tmdb.org/t/p/w500"
        static let movieGenreURL = "genre/movie/list?api_key=208ca80d1e219453796a7f9792d16776&language=en-US"
    }
    
    public struct MainScreen {
        static let searchBarText = "TV Show Reminder"
        static let allMovies = "TODAS"
    }
    
    public struct Buttons {
        static let buttonSubscribeDefaultText = "SUSCRIBIRME"
        static let buttonSubscribedText = "SUSCRIPTO"
        static let buttonAddMovie = "AGREGAR"
        static let buttonAddedMovie = "AGREGADO"
    }
    
    public struct LabelText {
        static let overview = "OVERVIEW"
    }
}
