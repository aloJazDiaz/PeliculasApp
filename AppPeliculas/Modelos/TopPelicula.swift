//
//  TopPelicula.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 02/12/25.
//
import Foundation

struct TopPelicula: Identifiable, Decodable {
    let id: Int
    let title: String
    let posterPath: String?
    let releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}

