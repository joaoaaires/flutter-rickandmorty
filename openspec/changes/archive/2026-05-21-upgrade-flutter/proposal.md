## Why

O projeto está preso no Flutter 2.x (Dart SDK >=2.15.1 <3.0.0) com dependências desatualizadas. Isso impede o uso de features modernas do Dart 3 (records, patterns, sealed classes), causa incompatibilidades com Ruby 3.2+ no CocoaPods, e várias dependências não recebem mais patches de segurança nas versões atuais.

## What Changes

- **BREAKING** Atualizar SDK constraint para Dart 3.x / Flutter 3.x (última estável)
- Atualizar todas as dependências para versões compatíveis com Flutter 3.x
- Migrar `flutter_lints` para `flutter_lints` → `lints` (pacote renomeado)
- Atualizar configurações Android (Gradle, compileSdkVersion, minSdkVersion)
- Atualizar configurações iOS (Podfile, deployment target)
- Corrigir breaking changes de API no código (null safety strict, Widget constructors com `super.key`)
- Atualizar `infinite_scroll_pagination` para v4.x (API mudou)
- Atualizar `flutter_launcher_icons` e `flutter_native_splash` para versões atuais

## Capabilities

### New Capabilities
- `flutter-upgrade`: Migração completa do projeto para Flutter 3.x com todas as dependências, configurações de plataforma e código atualizados

### Modified Capabilities

## Impact

- `pubspec.yaml` — SDK constraint e todas as dependências
- `analysis_options.yaml` — Novo pacote de lints
- `lib/**/*.dart` — Ajustes de null safety, constructors, APIs deprecadas
- `android/` — build.gradle, gradle wrapper, compileSdkVersion
- `ios/Podfile` — Deployment target, compatibilidade Ruby
- `web/index.html` — Possíveis ajustes no bootstrap do Flutter web
