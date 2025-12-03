//
//  PantallaTopDiez.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 02/12/25.
//

import SwiftUI

struct PantallaTopDiez: View {
    @EnvironmentObject var favs: FavoritosManager

    @StateObject private var vm = TopDiezViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("🔥 Top 10 Mundial")
                        .font(.largeTitle.bold())
                        .padding(.horizontal)
                        .padding(.top, 10)

                    if vm.cargando {
                        ProgressView("Cargando...")
                            .padding()
                    } else if let error = vm.error {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    } else {
                        topDiezHorizontal
                    }
                }
            }
            .navigationTitle("Top 10")
            .task {
                await vm.cargarTopDiez()
            }
        }
    }

    // MARK: - View del Top 10
    var topDiezHorizontal: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {

                ForEach(Array(vm.topPeliculas.enumerated()), id: \.element.id) { index, pelicula in

                    ZStack(alignment: .leading) {

                        // Número grande estilo Netflix
                        Text("\(index + 1)")
                            .font(.system(size: 120, weight: .heavy))
                            .foregroundColor(.gray.opacity(0.2))
                            .padding(.leading, -5)

                        VStack(alignment: .leading, spacing: 8) {
                            
                            // Imagen
                            ImagenRemota(url: "https://image.tmdb.org/t/p/w500\(pelicula.posterPath ?? "")")
                                .frame(width: 200, height: 300)
                                .cornerRadius(12)
                                .shadow(radius: 5)

                            Text(pelicula.title)
                                .font(.headline)
                                .lineLimit(1)

                            Text(pelicula.releaseDate ?? "Sin fecha")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 40)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
