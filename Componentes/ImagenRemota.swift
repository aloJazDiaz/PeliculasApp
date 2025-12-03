import SwiftUI

struct ImagenRemota: View {
    let url: String?

    var body: some View {
        if let urlString = url, let url = URL(string: urlString) {
            AsyncImage(url: url) { fase in
                switch fase {
                case .empty: ProgressView()
                case .success(let img):
                    img.resizable().aspectRatio(contentMode: .fit)
                case .failure: Image(systemName: "photo")
                @unknown default: EmptyView()
                }
            }
        } else {
            Image(systemName: "photo")
        }
    }
}
