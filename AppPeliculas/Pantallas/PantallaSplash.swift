//
//  PantallaSplash.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 02/12/25.
//

import SwiftUI

struct PantallaSplash: View {
    @EnvironmentObject var favs: FavoritosManager

    @State private var opacidad = 0.0
    @State private var irAInicio = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.purple, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            Image(systemName: "film.fill")
                .font(.system(size: 130))
                .foregroundColor(.white)
                .opacity(opacidad)
                .animation(.easeIn(duration: 1.5), value: opacidad)
        }
        .onAppear {
            opacidad = 1
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                irAInicio = true
            }
        }
        .fullScreenCover(isPresented: $irAInicio) {
            PantallaInicio()
        }
    }
}
