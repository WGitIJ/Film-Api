# Movies App

Aplicación Flutter que consume la API de [The Movie Database](https://www.themoviedb.org/) para mostrar el cartel actual y las películas más populares. Se basa en `provider` para la gestión de estado y utiliza componentes reutilizables (carruseles, tarjetas y sliders) con imágenes almacenadas en `assets/`.

## ✨ Características

- Cartelera (`now_playing`) y listado de películas populares con scroll infinito.
- Detalle de la película con sinopsis, puntuaciones y reparto principal.
- Carga diferida de imágenes con placeholders locales (`loading.gif`, `no-image.jpg`).
- Arquitectura basada en `ChangeNotifier` + `Provider`, desacoplando UI y capa de datos.
- Compatible con Android, iOS, Web, Windows, macOS y Linux (targets Flutter estándar).

## 🧱 Arquitectura y dependencias clave

- `lib/providers/movies_provider.dart`: orquesta las peticiones HTTP a TMDB y expone el estado.
- `lib/models/`: modelos generados a partir de las respuestas JSON (películas, reparto, etc.).
- `lib/screens/`: pantallas principales (`HomeScreen`, `DetailsScreen`).
- `lib/widgets/`: componentes reutilizables (swiper, sliders, tarjetas de casting).
- Paquetes externos: `provider`, `http`.

## 🔑 Requisitos previos

1. Flutter 3.24+ configurado (`flutter doctor -v` sin errores).
2. SDKs/plataformas que quieras compilar (Android Studio, Xcode, desktop runtimes, etc.).
3. Clave propia de TMDB (gratuita, pero requerida para producción). La plantilla incluye una clave de ejemplo; reemplázala por la tuya antes de publicar.

## ⚙️ Configuración inicial

```bash
git clone <repo>
cd movies_app_plantilla
flutter pub get
```

### Configurar la API Key

Edita `lib/providers/movies_provider.dart` y sustituye el valor de `_apiKey` por tu clave de TMDB:

```dart
final String _apiKey = '<TU_API_KEY>';
```

Para automatizarlo puedes usar `--dart-define` + `String.fromEnvironment`, pero no está implementado en esta plantilla.

## ▶️ Ejecutar el proyecto

```bash
flutter run        # Usa el dispositivo/emulador conectado
flutter run -d chrome   # Web
flutter run -d windows  # Desktop
```

## 🧪 Pruebas

```bash
flutter test
```

`test/widget_test.dart` contiene un ejemplo básico; añade tus propios casos para widgets y proveedores.

## 📁 Estructura destacada

- `lib/` código principal de Flutter.
- `assets/` imágenes locales y placeholders.
- `android/`, `ios/`, `macos/`, `linux/`, `windows/`, `web/` configuraciones específicas de plataforma.
- `test/` pruebas unitarias y de widgets.

## 🛠️ Próximos pasos sugeridos

- Añadir paginación real a la lista de populares.
- Implementar búsqueda de películas y favoritos locales.
- Extraer la API Key a variables de entorno (`flutter_dotenv`, `dart-define`).
- Mejorar la cobertura de pruebas y añadir tests de integración.

## 📚 Recursos útiles

- [Documentación oficial de Flutter](https://docs.flutter.dev/)
- [Provider package](https://pub.dev/packages/provider)
- [HTTP package](https://pub.dev/packages/http)
- [API TMDB](https://developer.themoviedb.org/docs)
