import SwiftUI

struct PantallaPeliculasPorPais: View {
    @EnvironmentObject var favs: FavoritosManager


    let pais: Pais
    @StateObject private var vm = PeliculasPorPaisViewModel()

    var body: some View {
        Group {
            if vm.cargando {
                ProgressView("Cargando películas...")
            }
            else if let error = vm.mensajeError {
                Text(error).foregroundColor(.red)
            }
            else {
                List(vm.peliculas) { pelicula in
                    NavigationLink(destination: PantallaDetallePelicula(pelicula: pelicula, vieneDeBusqueda: false)) {
                        TarjetaPelicula(pelicula: pelicula)
                    }
                }
            }
        }
        .navigationTitle("Películas Más Populares de \(pais.nombre)")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await vm.cargarPeliculasDePais(codigoPais: pais.codigoPais)
        }
    }
}
