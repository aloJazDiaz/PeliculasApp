import Foundation
import Combine

@MainActor
class PaisesViewModel: ObservableObject {

    @Published var paises: [Pais] = []
    @Published var cargando = false
    @Published var mensajeError: String? = nil

    private let api = PaisesAPI()

    func cargarPaises() async {
        cargando = true
        mensajeError = nil

        do {
            paises = try await api.obtenerPaises()
        } catch {
            mensajeError = "No se pudieron cargar los países."
            print(error)
        }

        cargando = false
    }
}
