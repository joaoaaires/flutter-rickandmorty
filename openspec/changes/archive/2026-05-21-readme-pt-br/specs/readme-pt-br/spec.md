## ADDED Requirements

### Requirement: README PT-BR exists as separate file
The project SHALL have a `README.pt-br.md` file at the root containing the full project documentation translated to Brazilian Portuguese.

#### Scenario: File exists with PT-BR content
- **WHEN** a developer navigates to the project root
- **THEN** they find `README.pt-br.md` with all documentation in Portuguese

### Requirement: README PT-BR has language navigation link
The `README.pt-br.md` SHALL contain a link at the top pointing to the English version (`README.md`).

#### Scenario: Navigation to English version
- **WHEN** a developer views `README.pt-br.md`
- **THEN** they see a link labeled "🇺🇸 English" pointing to `README.md`

### Requirement: README PT-BR contains all sections translated
The `README.pt-br.md` SHALL contain all sections from the English README translated: overview, demo, architecture, project structure, features, dependencies, getting started, and API reference.

#### Scenario: All sections present in Portuguese
- **WHEN** a developer reads `README.pt-br.md`
- **THEN** they find all sections with descriptive text in Portuguese while technical terms remain in English
