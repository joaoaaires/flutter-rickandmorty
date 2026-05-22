## ADDED Requirements

### Requirement: SDK version matches pubspec.yaml
The README prerequisites section SHALL display the Flutter SDK version that matches the `environment.sdk` constraint in `pubspec.yaml`.

#### Scenario: SDK version is accurate
- **WHEN** a user reads the Prerequisites section of README.md or README.pt-br.md
- **THEN** the Flutter SDK version shown SHALL be `>=3.12.0`

### Requirement: Dependency versions match pubspec.yaml
The README dependencies table SHALL list version numbers that match the versions specified in `pubspec.yaml`.

#### Scenario: Dependency table reflects current versions
- **WHEN** a user reads the Dependencies table in either README
- **THEN** each package version SHALL match the corresponding entry in `pubspec.yaml`

### Requirement: Both README files are consistent
Both `README.md` and `README.pt-br.md` SHALL contain the same technical information (versions, dependencies, structure).

#### Scenario: Language versions have identical technical data
- **WHEN** comparing technical content between README.md and README.pt-br.md
- **THEN** SDK versions, dependency versions, and project structure SHALL be identical
