# PeliculasApp

🎬 AppPelículas
AppPelículas es una aplicación desarrollada en SwiftUI que permite explorar las películas más populares por región, utilizando la API de TheMovieDB (TMDB).
El usuario puede consultar detalles completos de cada película y administrar una lista de favoritos de manera simple e intuitiva.
⭐ Características
🌍 Navegación por películas populares según país
🎞️ Detalles completos (descripción, rating, idioma, fecha, popularidad)
❤️ Sistema de favoritos con persistencia
📡 Consumo de API REST de TMDB Y REST contruies
🖼️ Carga remota de imágenes
⚡ Interfaz moderna con SwiftUI
🔎 Navegación con NavigationStack
🏗️ Arquitectura
El proyecto utiliza el patrón MVVM:
Modelos: Representan películas y países.
ViewModels: Manejan la lógica, llamadas a la API y estados.
Vistas: Pantallas SwiftUI para mostrar listas, detalles y favoritos.
Servicios: Clase encargada de las peticiones HTTP.
FavoritosManager: Gestiona la lista de favoritos usando @EnvironmentObject.
⚙️ Instalación
Clonar el repositorio.
Agregar tu API Key de TMDB en el archivo correspondiente.
Ejecutar el proyecto en Xcode.
🧰 Tecnologías
Swift
SwiftUI
MVVM
URLSession
TMDB API
🛠️ Futuras Mejoras
Filtros por género
Modo oscuro mejorado
Búsqueda de películas
Cache de imágenes
