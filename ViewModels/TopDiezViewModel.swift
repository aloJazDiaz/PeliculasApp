//
//  TopDiezViewModel.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 02/12/25.
//
import Foundation
import Combine

@MainActor
class TopDiezViewModel: ObservableObject {

    @Published var topPeliculas: [TopPelicula] = []
    @Published var cargando = false
    @Published var error: String?

    private let apiKey = "0010e211d2f46f7b2fdfa6b6a97f7c90"

    func cargarTopDiez() async {
        cargando = true
        error = nil

        let urlString = "https://api.themoviedb.org/3/trending/movie/week?api_key=\(apiKey)&language=es-MX"
        
        guard let url = URL(string: urlString) else {
            error = "URL inválida"
            cargando = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let res = try JSONDecoder().decode(RespuestaTop.self, from: data)
            
            self.topPeliculas = Array(res.results.prefix(10)) // SOLO TOP 10
        }
        catch {
            self.error = "Error al cargar datos"
        }

        cargando = false
    }
}

struct RespuestaTop: Decodable {
    let results: [TopPelicula]
}

