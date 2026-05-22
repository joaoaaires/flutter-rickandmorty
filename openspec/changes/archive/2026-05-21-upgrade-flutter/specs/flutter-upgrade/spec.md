## ADDED Requirements

### Requirement: Project uses Flutter 3.29+ SDK
The project SHALL declare a Dart SDK constraint compatible with Flutter 3.29+ (Dart >=3.7.0).

#### Scenario: SDK constraint is updated
- **WHEN** a developer runs `flutter pub get`
- **THEN** the project resolves dependencies successfully with Flutter 3.29+

### Requirement: All dependencies are compatible with Flutter 3.x
The project SHALL use dependency versions that are compatible with Dart 3.x and Flutter 3.29+.

#### Scenario: Dependencies resolve without conflicts
- **WHEN** `flutter pub get` is executed
- **THEN** all dependencies resolve without version conflicts or SDK incompatibilities

### Requirement: Android configuration supports current toolchain
The project SHALL use compileSdk 34+, minSdk 21, and Gradle 8.x for Android builds.

#### Scenario: Android build succeeds
- **WHEN** `flutter build apk` is executed
- **THEN** the APK builds successfully without Gradle or SDK errors

### Requirement: iOS configuration supports current toolchain
The project SHALL use iOS deployment target 12.0+ and a Podfile compatible with Ruby 3.2+.

#### Scenario: iOS build succeeds
- **WHEN** `flutter build ios` is executed
- **THEN** the build completes without CocoaPods or Xcode errors

### Requirement: Code uses current Dart 3 idioms
The project SHALL use `super.key` constructor pattern and have no deprecation warnings from Flutter 3.x APIs.

#### Scenario: No deprecation warnings
- **WHEN** `flutter analyze` is executed
- **THEN** no deprecation warnings are reported

### Requirement: Paginated lists work with updated pagination library
The project SHALL use `infinite_scroll_pagination` v4.x with updated builder APIs.

#### Scenario: Character list loads with pagination
- **WHEN** a user opens the Character list
- **THEN** characters load in pages with infinite scroll working correctly

#### Scenario: Episode list loads with pagination
- **WHEN** a user opens the Episode list
- **THEN** episodes load in pages with infinite scroll working correctly

#### Scenario: Location list loads with pagination
- **WHEN** a user opens the Location list
- **THEN** locations load in pages with infinite scroll working correctly

### Requirement: App runs on all target platforms
The project SHALL build and run on Android, iOS, and Web after the upgrade.

#### Scenario: Web build succeeds
- **WHEN** `flutter build web` is executed
- **THEN** the web build completes successfully
