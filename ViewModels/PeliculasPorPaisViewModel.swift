import Foundation
import Combine
@MainActor
class PeliculasPorPaisViewModel: ObservableObject {

    @Published var peliculas: [Pelicula] = []
    @Published var cargando = false
    @Published var mensajeError: String?

    private let api = PeliculasAPI()

    func cargarPeliculasDePais(codigoPais: String) async {
        cargando = true
        mensajeError = nil

        do {
            let respuesta = try await api.obtenerPeliculasPorPais(codigoPais: codigoPais)
            peliculas = respuesta.results
        } catch {
            mensajeError = "No se pudieron cargar las películas del país."
        }

        cargando = false
    }
}
