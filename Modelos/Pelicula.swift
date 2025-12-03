//
//  Pelicula.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 01/12/25.
//

import Foundation

struct Pelicula: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double?
    let releaseDate: String?
    let originalLanguage: String?
    let popularity: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
        case originalLanguage = "original_language"
        case popularity
    }
}


