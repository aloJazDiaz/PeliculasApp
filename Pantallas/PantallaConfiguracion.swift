//
//  PantallaConfiguracion.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 01/12/25.
//

import SwiftUI

struct PantallaConfiguracion: View {
    @AppStorage("modoOscuro") private var modoOscuro = false
    @AppStorage("notificaciones") private var notificaciones = true

    var body: some View {
        Form {

            Section(header: Text("Apariencia")) {
                Toggle("Modo oscuro", isOn: $modoOscuro)
            }

            Section(header: Text("Notificaciones")) {
                Toggle("Habilitar notificaciones", isOn: $notificaciones)
            }

            Section(header: Text("Información de la App")) {
                HStack {
                    Text("Versión")
                    Spacer()
                    Text("1.0.0")
                        .foregroundColor(.secondary)
                }

                HStack {
                    Text("Desarrollado por")
                    Spacer()
                    Text("Alondra")
                        .foregroundColor(.secondary)
                }
            }

        }
        .navigationTitle("Configuración")
    }
}
