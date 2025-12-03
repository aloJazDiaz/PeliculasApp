import SwiftUI

struct PantallaListaPaises: View {

    @StateObject private var vm = PaisesViewModel()
    @State private var busqueda = ""

    var paisesFiltrados: [Pais] {
        if busqueda.isEmpty {
            return vm.paises
        } else {
            return vm.paises.filter {
                $0.nombre.lowercased().contains(busqueda.lowercased())
            }
        }
    }

    var body: some View {
        VStack {
            // 🔍 BUSCADOR
            TextField("Buscar país...", text: $busqueda)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            // 📌 LISTA DE PAISES
            List(paisesFiltrados) { pais in
                NavigationLink(destination: PantallaPeliculasPorPais(pais: pais)) {
                    HStack {
                        AsyncImage(url: URL(string: pais.banderaURL)) { img in
                            img.resizable().scaledToFit()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 40, height: 30)
                        .cornerRadius(4)

                        Text(pais.nombre)
                    }
                }
            }
        }
        .navigationTitle("Países")
        .task {
            await vm.cargarPaises()
        }
    }
}
