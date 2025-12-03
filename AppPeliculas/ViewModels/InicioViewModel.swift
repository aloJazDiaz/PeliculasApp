//
//  InicioViewModel.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 01/12/25.
//

import SwiftUI
import Combine

@MainActor
class InicioViewModel: ObservableObject {
    @Published var peliculas: [Pelicula] = []
    @Published var cargando = false
    @Published var mensajeError: String?

    private let api = PeliculasAPI()

    func cargarPeliculas() async {
        cargando = true
        mensajeError = nil

        do {
            let respuesta = try await api.obtenerPeliculasPopulares()
            peliculas = respuesta.results
        } catch {
            mensajeError = "No se pudieron cargar las películas."
        }

        cargando = false
    }
}

