[🇺🇸 English](README.md)

# Rick and Morty - Flutter App

Uma aplicação Flutter que consome a [Rick and Morty API](https://rickandmortyapi.com/) para exibir personagens, episódios e localizações da série. Construída com **Clean Architecture** e **GetX** para gerenciamento de estado e injeção de dependência.

## Demo

![App Demo](https://user-images.githubusercontent.com/11095781/155903885-f6890f0d-7b65-4897-b7de-17268cf110c5.gif)

## Arquitetura

O projeto segue os princípios de **Clean Architecture**, separando responsabilidades em três camadas:

- **Data** — Datasources (chamadas à API), Models (mapeamento JSON), implementações de Repository
- **Domain** — Entities (objetos de negócio), Use Cases (lógica de negócio), contratos de Repository (abstrações)
- **Presentation** — Pages, Widgets, Controllers (GetX)

**GetX** é utilizado para:
- Gerenciamento de estado (variáveis reativas `.obs`)
- Injeção de dependência (Bindings)
- Gerenciamento de rotas (GetMaterialApp, GetPage)

## Estrutura do Projeto

```
lib/
├── main.dart
├── injection_container.dart
└── app/
    ├── app_widget.dart
    ├── core/
    │   ├── error/          # Classes de Failure e Exception
    │   ├── usecases/       # Classe abstrata UseCase
    │   ├── util/           # Config (URL base da API), Spacer
    │   └── widgets/        # Widgets compartilhados
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
    │   ├── home/           # Página inicial com navegação por drawer
    │   └── shared/         # Entidades e models compartilhados (Page)
    ├── routes/             # Rotas e definições de páginas
    └── theme/              # Tema do app (esquema de cores Material)
```

## Funcionalidades

| Funcionalidade | Capacidades |
|----------------|-------------|
| **Character** | Lista paginada com scroll infinito, tela de detalhes com informações completas (status, espécie, gênero, origem, localização, episódios) |
| **Episode** | Lista paginada exibindo nome do episódio, data de exibição e código |
| **Location** | Lista paginada exibindo nome da localização, tipo e dimensão |

A navegação entre funcionalidades é feita por um menu drawer na página inicial.

## Dependências

| Pacote | Finalidade |
|--------|-----------|
| [get](https://pub.dev/packages/get) | Gerenciamento de estado, injeção de dependência, gerenciamento de rotas |
| [http](https://pub.dev/packages/http) | Cliente HTTP para requisições à API |
| [dartz](https://pub.dev/packages/dartz) | Programação funcional (tipo Either para tratamento de erros) |
| [equatable](https://pub.dev/packages/equatable) | Igualdade por valor para entidades e failures |
| [infinite_scroll_pagination](https://pub.dev/packages/infinite_scroll_pagination) | Listas paginadas com scroll infinito |
| [skeleton_loader](https://pub.dev/packages/skeleton_loader) | Placeholders de carregamento (skeleton) |

## Como Começar

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>=2.15.1)
- Android Studio / Xcode (para mobile) ou Chrome (para web)

### Configuração

```bash
# Clonar o repositório
git clone https://github.com/joaoaaires/flutter-rickandmorty.git
cd flutter-rickandmorty

# Instalar dependências
flutter pub get

# Executar no Android
flutter run

# Executar no iOS
flutter run -d ios

# Executar na Web
flutter run -d chrome
```

## Referência da API

Este app consome a [Rick and Morty API](https://rickandmortyapi.com/documentation).

**Endpoints utilizados:**

| Endpoint | Descrição |
|----------|-----------|
| `GET /api/character?page={n}` | Listar personagens (paginado) |
| `GET /api/character/{id}` | Obter um personagem por URL |
| `GET /api/episode?page={n}` | Listar episódios (paginado) |
| `GET /api/episode/{id}` | Obter um episódio por URL |
| `GET /api/location?page={n}` | Listar localizações (paginado) |
| `GET /api/location/{id}` | Obter uma localização por URL |

URL base: `https://rickandmortyapi.com/api`
