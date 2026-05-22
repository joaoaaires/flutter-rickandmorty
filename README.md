[🇧🇷 Português](README.pt-br.md)

# Rick and Morty - Flutter App

A Flutter application that consumes the [Rick and Morty API](https://rickandmortyapi.com/) to display characters, episodes, and locations from the show. Built with **Clean Architecture** and **GetX** for state management and dependency injection.

## Demo

![App Demo](https://user-images.githubusercontent.com/11095781/155903885-f6890f0d-7b65-4897-b7de-17268cf110c5.gif)

## Architecture

The project follows **Clean Architecture** principles, separating concerns into three layers:

- **Data** — Datasources (API calls), Models (JSON mapping), Repository implementations
- **Domain** — Entities (business objects), Use Cases (business logic), Repository contracts (abstractions)
- **Presentation** — Pages, Widgets, Controllers (GetX)

**GetX** is used for:
- State management (reactive `.obs` variables)
- Dependency injection (Bindings)
- Route management (GetMaterialApp, GetPage)

## Project Structure

```
lib/
├── main.dart
├── injection_container.dart
└── app/
    ├── app_widget.dart
    ├── core/
    │   ├── error/          # Failure and Exception classes
    │   ├── usecases/       # UseCase abstract class
    │   ├── util/           # Config (API base URL), Spacer
    │   └── widgets/        # Shared widgets
    ├── features/
    │   ├── character/
    │   │   ├── data/       # datasources, models, repositories
    │   │   ├── domain/     # entities, usecases, repositories
    │   │   └── presentation/ # character_list, character_form, character_item
    │   ├── episode/
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/ # episode_list, episode_item
    │   ├── location/
    │   │   ├── data/
    │   │   ├── domain/
    │   │   └── presentation/ # location_list, location_item
    │   ├── home/           # Home page with drawer navigation
    │   └── shared/         # Shared entities and models (Page)
    ├── routes/             # App routes and page definitions
    └── theme/              # App theme (Material color scheme)
```

## Features

| Feature | Capabilities |
|---------|-------------|
| **Character** | Paginated list with infinite scroll, detail view with full info (status, species, gender, origin, location, episodes) |
| **Episode** | Paginated list displaying episode name, air date, and code |
| **Location** | Paginated list displaying location name, type, and dimension |

Navigation between features is done via a drawer menu on the home page.

## Dependencies

| Package | Purpose |
|---------|---------|
| [get](https://pub.dev/packages/get) | State management, dependency injection, route management |
| [http](https://pub.dev/packages/http) | HTTP client for API requests |
| [dartz](https://pub.dev/packages/dartz) | Functional programming (Either type for error handling) |
| [equatable](https://pub.dev/packages/equatable) | Value equality for entities and failures |
| [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) | Paginated list views with infinite scroll |
| [skeleton_loader](https://pub.dev/packages/skeleton_loader) | Loading skeleton placeholders |

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>=3.12.0)
- Android Studio / Xcode (for mobile) or Chrome (for web)

### Setup

```bash
# Clone the repository
git clone https://github.com/joaoaaires/flutter-rickandmorty.git
cd flutter-rickandmorty

# Install dependencies
flutter pub get

# Run on Android
flutter run

# Run on iOS
flutter run -d ios

# Run on Web
flutter run -d chrome
```

## API Reference

This app consumes the [Rick and Morty API](https://rickandmortyapi.com/documentation).

**Endpoints used:**

| Endpoint | Description |
|----------|-------------|
| `GET /api/character?page={n}` | List characters (paginated) |
| `GET /api/character/{id}` | Get a single character by URL |
| `GET /api/episode?page={n}` | List episodes (paginated) |
| `GET /api/episode/{id}` | Get a single episode by URL |
| `GET /api/location?page={n}` | List locations (paginated) |
| `GET /api/location/{id}` | Get a single location by URL |

Base URL: `https://rickandmortyapi.com/api`
