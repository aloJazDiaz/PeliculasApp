import Foundation
class PaisesAPI {
    private let servicio = ServicioAPI()

    func obtenerPaises() async throws -> [Pais] {
        let url = URL(string: "https://restcountries.com/v3.1/all?fields=name,flags,cca2")!

        let respuestaAPI: [PaisAPI] = try await servicio.obtenerDatos(desde: url)

        // 🔵 Filtrar solo países que sí tienen código
        let paisesValidos = respuestaAPI.filter { $0.cca2 != nil }

        // 🔵 Convertimos al modelo de la app
        return paisesValidos.map { api in
            Pais(
                nombre: api.name.common,
                banderaURL: api.flags.png,
                codigoPais: api.cca2 ?? ""   // ya nunca será nil
            )
        }
    }
}
