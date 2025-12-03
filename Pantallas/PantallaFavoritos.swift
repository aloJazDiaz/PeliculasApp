//
//  PantallaFavoritos.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 02/12/25.
//
import SwiftUI

struct PantallaFavoritos: View {
    @EnvironmentObject var favs: FavoritosManager
    @StateObject private var vm = InicioViewModel()

    var body: some View {
        VStack {
            if vm.cargando {
                ProgressView("Cargando favoritos...")
            } else {

                let peliculasFiltradas = vm.peliculas.filter { pelicula in
                    favs.favoritos.contains { $0.id == pelicula.id }
                }

                if peliculasFiltradas.isEmpty {
                    Text("No tienes películas favoritas aún.")
                        .foregroundColor(.gray)
                } else {
                    List(peliculasFiltradas) { pelicula in
                        NavigationLink(destination: PantallaDetallePelicula(pelicula: pelicula)) {
                            TarjetaPelicula(pelicula: pelicula)
                        }
                    }
                }
            }
        }
        .navigationTitle("Favoritos")
        .task {
            await vm.cargarPeliculas()
        }
    }
}

