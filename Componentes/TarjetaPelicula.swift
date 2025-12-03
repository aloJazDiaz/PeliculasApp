import SwiftUI

struct TarjetaPelicula: View {
    let pelicula: Pelicula
    
    @EnvironmentObject var favs: FavoritosManager

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            
            // IMAGEN
            ImagenRemota(url: "https://image.tmdb.org/t/p/w200\(pelicula.posterPath ?? "")")
                .frame(width: 80, height: 120)
                .cornerRadius(10)
                .shadow(radius: 3)

            // TÍTULO + DESCRIPCIÓN
            VStack(alignment: .leading, spacing: 6) {
                Text(pelicula.title)
                    .font(.headline)
                    .lineLimit(2)

                Text(pelicula.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
            }

            Spacer()

            // BOTÓN FAVORITOS
            Button(action: {
                favs.toggleFavorito(pelicula)
            }) {
                Image(systemName: favs.esFavorito(pelicula) ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .font(.title2)
            }
        }
        .padding(.vertical, 6)
    }
}
