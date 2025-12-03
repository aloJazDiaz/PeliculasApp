//
//  ServicioAPI.swift
//  AppPeliculas
//
//  Created by Alondra Diaz Ornelas on 01/12/25.
//

import Foundation

class ServicioAPI {
    
    
    
        func obtenerDatos<T: Decodable>(desde url: URL) async throws -> T {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode(T.self, from: data)
        }
    

}
