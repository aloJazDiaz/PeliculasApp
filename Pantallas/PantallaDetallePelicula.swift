import SwiftUI

struct PantallaDetallePelicula: View {
    @EnvironmentObject var favs: FavoritosManager
    let pelicula: Pelicula

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {

                // IMAGEN PRINCIPAL
                ImagenRemota(url: "https://image.tmdb.org/t/p/w500\(pelicula.backdropPath ?? pelicula.posterPath ?? "")")
                    .frame(height: 380)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        LinearGradient(
                            colors: [.clear, .black.opacity(0.8)],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                    )
                    .overlay(
                        VStack(alignment: .leading) {
                            Spacer()
                            Text(pelicula.title)
                                .font(.title.bold())
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        .padding(),
                        alignment: .bottomLeading
                    )

                VStack(alignment: .leading, spacing: 16) {

                    // DESCRIPCIÓN
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Descripción")
                            .font(.title3.bold())

                        if !pelicula.overview.isEmpty {
                            Text(pelicula.overview)
                                .foregroundColor(.secondary)
                        } else {
                            Text("Sin descripción disponible.")
                                .foregroundColor(.gray)
                        }
                    }

                    Divider()

                    // INFORMACIÓN EXTRA
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Información")
                            .font(.title3.bold())

                        if let rating = pelicula.voteAverage {
                            infoRow(icon: "star.fill", color: .yellow, texto: "Calificación: \(String(format: "%.1f", rating))/10")
                        }

                        if let fecha = pelicula.releaseDate, !fecha.isEmpty {
                            infoRow(icon: "calendar", color: .blue, texto: "Estreno: \(fecha)")
                        }

                        if let idioma = pelicula.originalLanguage {
                            infoRow(icon: "globe", color: .green, texto: "Idioma original: \(idioma.uppercased())")
                        }

                        if let pop = pelicula.popularity {
                            infoRow(icon: "flame.fill", color: .red, texto: "Popularidad: \(Int(pop))")
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    favs.toggleFavorito(pelicula)
                }) {
                    Image(systemName: favs.esFavorito(pelicula) ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                        .font(.title2)
                }
            }
        }
        .background(Color(.systemGroupedBackground))
    }

    // COMPONENTE REUTILIZABLE
    private func infoRow(icon: String, color: Color, texto: String) -> some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(color)
            Text(texto)
        }
        .font(.body)
    }
}
