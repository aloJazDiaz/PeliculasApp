//
//  PeliculasAPI.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 01/12/25.
//

//
//  PeliculasAPI 2.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 01/12/25.
//

import Foundation


class PeliculasAPI {
    private let apiKey = "0010e211d2f46f7b2fdfa6b6a97f7c90"
    private let servicio = ServicioAPI()

    func obtenerPeliculasPopulares() async throws -> RespuestaPeliculas {
        let url = URL(string:
            "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=es-MX"
        )!
        return try await servicio.obtenerDatos(desde: url)
    }

    
    
    
    func obtenerPeliculasPorPais(codigoPais: String) async throws -> RespuestaPeliculas {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=0010e211d2f46f7b2fdfa6b6a97f7c90&region=\(codigoPais)"
        
        let url = URL(string: urlString)!
        return try await servicio.obtenerDatos(desde: url)
    }
    
    func buscarPelicula(nombre: String) async throws -> RespuestaPeliculas {
        let texto = nombre.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? nombre
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(texto)&api_key=0010e211d2f46f7b2fdfa6b6a97f7c90&language=es-MX")!
        return try await servicio.obtenerDatos(desde: url)
    }



}
