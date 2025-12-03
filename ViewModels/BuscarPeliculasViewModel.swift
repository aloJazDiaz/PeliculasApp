//
//  BuscarPeliculasViewModel.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 02/12/25.
//

import Foundation
import Combine

@MainActor
class BuscarPeliculasViewModel: ObservableObject {

    @Published var query: String = ""
    @Published var resultados: [Pelicula] = []
    @Published var cargando = false
    @Published var mensajeError: String? = nil

    private let api = PeliculasAPI()
    private var buscarCancellable: AnyCancellable?

    init() {
        // Busca automáticamente cuando el usuario deja de escribir por 0.5 seg
        buscarCancellable = $query
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] texto in
                Task { await self?.buscarPeliculas() }
            }
    }

    func buscarPeliculas() async {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            resultados = []
            return
        }

        cargando = true
        mensajeError = nil

        do {
            let datos = try await api.buscarPelicula(nombre: query)
            resultados = datos.results
        } catch {
            mensajeError = "Error buscando películas."
        }

        cargando = false
    }
}
