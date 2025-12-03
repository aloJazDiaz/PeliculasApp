import Foundation
import Combine
class FavoritosManager: ObservableObject {
    @Published var favoritos: [Pelicula] = []

    func esFavorito(_ pelicula: Pelicula) -> Bool {
        favoritos.contains(where: { $0.id == pelicula.id })
    }

    func toggleFavorito(_ pelicula: Pelicula) {
        if esFavorito(pelicula) {
            favoritos.removeAll { $0.id == pelicula.id }
        } else {
            favoritos.append(pelicula)
        }
    }
}
