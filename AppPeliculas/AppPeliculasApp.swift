//
//  AppPeliculasApp.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 01/12/25.
//
import SwiftUI

@main
struct AppPeliculasApp: App {
    @StateObject var favoritosManager = FavoritosManager()

    var body: some Scene {
        WindowGroup {
            PantallaSplash()
                .environmentObject(favoritosManager)
        }
    }
}
