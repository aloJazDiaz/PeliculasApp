import SwiftUI

struct PantallaInicio: View {
    @EnvironmentObject var favs: FavoritosManager

    @StateObject private var vm = InicioViewModel()

    var body: some View {
        NavigationView {
            VStack {
                
                // MENU SUPERIOR
                HStack {
                    NavigationLink(destination: PantallaBuscarPeliculas()) {
                        Label("", systemImage: "magnifyingglass")
                    }
                    Spacer()
                    NavigationLink(destination: PantallaTopDiez()) {
                        Label("Top 10", systemImage: "rosette")
                    }
                    Spacer()
                    NavigationLink(destination: PantallaFavoritos()) {
                        Label("Favs", systemImage: "star")
                    }
                    Spacer()
                    NavigationLink(destination: PantallaListaPaises()) {
                        Label("", systemImage: "globe")
                    }
                    Spacer()
                    NavigationLink(destination: PantallaConfiguracion()) {
                        Label("Ajustes", systemImage: "gearshape")
                    }
                }
                .padding()
                
                Divider()

                // CONTENIDO PRINCIPAL DE PELÍCULAS
                Group {
                    if vm.cargando {
                        ProgressView("Cargando...")
                    } else if let error = vm.mensajeError {
                        Text(error)
                            .foregroundColor(.red)
                    } else {
                        List(vm.peliculas) { pelicula in
                            NavigationLink(destination: PantallaDetallePelicula(pelicula: pelicula, vieneDeBusqueda: false)) {
                                TarjetaPelicula(pelicula: pelicula)
                            }
                        }
                        .listStyle(.plain)
                    }
                }
            }
            .navigationTitle("Películas Populares")
            .task {
                await vm.cargarPeliculas()
            }
        }
    }
}
