import SwiftUI

struct PantallaDetallePelicula: View {
    @EnvironmentObject var favs: FavoritosManager
    @Environment(\.dismiss) var dismiss

    let pelicula: Pelicula
    let vieneDeBusqueda: Bool

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                // IMAGEN PRINCIPAL (HERO IMAGE)
                ZStack(alignment: .topTrailing) {
                    
                    ImagenRemota(url: "https://image.tmdb.org/t/p/w500\(pelicula.backdropPath ?? pelicula.posterPath ?? "")")
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                        .ignoresSafeArea(edges: .top)
                    
                  
                    Button(action: {
                        favs.toggleFavorito(pelicula)
                    }) {
                        Image(systemName: favs.esFavorito(pelicula) ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                            .font(.title2)
                            .padding()
                    }
                }
                
                VStack(alignment: .leading, spacing: 16) {
                    
                    Text(pelicula.title)
                        .font(.title)
                        .bold()
                    
                    Text("Descripción")
                        .font(.headline)
                    
                    Text(pelicula.overview)
                        .font(.body)
                    
                    Divider()
                    
                    VStack {
                        Text("Información")
                            .font(.title3.bold())
                        
                        if let rating = pelicula.voteAverage {
                            infoRow(icon: "star.fill", color: .yellow,
                                    texto: "Calificación: \(String(format: "%.1f", rating))/10")
                        }
                        
                        if let fecha = pelicula.releaseDate, !fecha.isEmpty {
                            infoRow(icon: "calendar", color: .blue,
                                    texto: "Estreno: \(fecha)")
                        }
                        
                        if let idioma = pelicula.originalLanguage {
                            infoRow(icon: "globe", color: .green,
                                    texto: "Idioma original: \(idioma.uppercased())")
                        }
                        
                        if let pop = pelicula.popularity {
                            infoRow(icon: "flame.fill", color: .red,
                                    texto: "Popularidad: \(Int(pop))")
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 20)
            }
        }

        
        .navigationBarBackButtonHidden(vieneDeBusqueda)
        .toolbar {
            
           
        }
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
