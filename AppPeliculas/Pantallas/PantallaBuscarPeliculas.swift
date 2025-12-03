//
//  PantallaBuscarPeliculas.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 02/12/25.
//

import SwiftUI

struct PantallaBuscarPeliculas: View {
    @EnvironmentObject var favs: FavoritosManager

    @StateObject private var vm = BuscarPeliculasViewModel()

    var body: some View {
        NavigationView {
            VStack {
                // CAMPO DE BÚSQUEDA
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Buscar película...", text: $vm.query)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(12)
                .padding(.horizontal)

                // RESULTADOS
                if vm.cargando {
                    ProgressView("Buscando...")
                        .padding(.top)
                } else if let error = vm.mensajeError {
                    Text(error)
                        .foregroundColor(.red)
                        .padding(.top)
                } else {
                    List(vm.resultados) { pelicula in
                        NavigationLink(destination: PantallaDetallePelicula(pelicula: pelicula, vieneDeBusqueda: true)) {
                            TarjetaPelicula(pelicula: pelicula)
                        }
                    }
                    .listStyle(.plain)
                }

                Spacer()
            }
            .navigationTitle("Buscar")
        }
    }
}
