## Requirements

### Requirement: README contains project overview
The README SHALL contain a brief description of the project, identifying it as a Flutter app that consumes the Rick and Morty API using Clean Architecture and GetX.

#### Scenario: Reader identifies project purpose
- **WHEN** a developer opens the README
- **THEN** they can identify the project's purpose, tech stack, and architecture pattern within the first section

### Requirement: README displays demo GIF
The README SHALL display the existing animated GIF demonstrating the app's functionality.

#### Scenario: Demo is visible
- **WHEN** a developer views the README on GitHub
- **THEN** the GIF from user-content is rendered showing the app in action

### Requirement: README documents architecture
The README SHALL document the Clean Architecture layers (data, domain, presentation) and how GetX is used for state management and dependency injection.

#### Scenario: Architecture is explained
- **WHEN** a developer reads the Architecture section
- **THEN** they understand the separation into data/domain/presentation layers and the role of GetX

### Requirement: README shows project structure
The README SHALL include a text-based folder tree showing the main directories under `lib/app/`.

#### Scenario: Folder structure is clear
- **WHEN** a developer reads the Project Structure section
- **THEN** they can see the organization of core/, features/, routes/, and theme/ directories

### Requirement: README lists features
The README SHALL list all implemented features (Character, Episode, Location) with brief descriptions of their capabilities.

#### Scenario: Features are enumerated
- **WHEN** a developer reads the Features section
- **THEN** they see Character (list + detail), Episode (list), and Location (list) documented

### Requirement: README documents dependencies
The README SHALL list the main dependencies (get, http, dartz, equatable, infinite_scroll_pagination, skeleton_loader) with their purpose.

#### Scenario: Dependencies are explained
- **WHEN** a developer reads the Dependencies section
- **THEN** they understand what each package is used for in the project

### Requirement: README provides setup instructions
The README SHALL provide instructions to clone, install dependencies, and run the project on Android, iOS, and Web.

#### Scenario: Developer can run the project
- **WHEN** a developer follows the Getting Started instructions
- **THEN** they can successfully clone the repo, run `flutter pub get`, and launch the app

### Requirement: README references the API
The README SHALL include a link to the Rick and Morty API documentation and list the endpoints consumed (character, episode, location).

#### Scenario: API reference is accessible
- **WHEN** a developer reads the API section
- **THEN** they find a link to https://rickandmortyapi.com/documentation and know which endpoints are used

### Requirement: README has language navigation link
The `README.md` SHALL contain a link at the top pointing to the Portuguese version (`README.pt-br.md`).

#### Scenario: Navigation to PT-BR version
- **WHEN** a developer views `README.md`
- **THEN** they see a link labeled "🇧🇷 Português" pointing to `README.pt-br.md`