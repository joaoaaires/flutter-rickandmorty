## 1. Atualizar SDK e Dependências

- [x] 1.1 Atualizar `pubspec.yaml`: SDK constraint para `>=3.7.0 <4.0.0`
- [x] 1.2 Atualizar dependências principais: `get`, `http` (→ ^1.x), `dartz`, `equatable`, `infinite_scroll_pagination` (→ ^4.x), `skeleton_loader`, `cupertino_icons`
- [x] 1.3 Atualizar dev_dependencies: `flutter_lints` (→ ^3.0.0 ou `lints`), `flutter_launcher_icons` (→ ^0.13+), `flutter_native_splash` (→ ^2.3+)
- [x] 1.4 Atualizar `analysis_options.yaml` para usar o pacote de lints atualizado
- [x] 1.5 Executar `flutter pub get` e resolver conflitos de versão

## 2. Configuração Android

- [x] 2.1 Atualizar `android/build.gradle`: Gradle plugin version, repositories
- [x] 2.2 Atualizar `android/app/build.gradle`: compileSdk 34+, minSdk 21, targetSdk 34
- [x] 2.3 Atualizar `android/gradle/wrapper/gradle-wrapper.properties` para Gradle 8.x
- [x] 2.4 Atualizar `android/settings.gradle` se necessário

## 3. Configuração iOS

- [x] 3.1 Atualizar `ios/Podfile`: deployment target para 12.0, fix de compatibilidade Ruby 3.2+
- [x] 3.2 Executar `pod install` no diretório ios/ para regenerar Podfile.lock

## 4. Configuração Web

- [x] 4.1 Atualizar `web/index.html` para o bootstrap pattern do Flutter 3.x (se necessário)

## 5. Migração de Código

- [x] 5.1 Migrar constructors de widgets para usar `super.key` ao invés de `Key? key` + `super(key: key)`
- [x] 5.2 Atualizar widgets de lista (CharacterListWidget, EpisodeListWidget, LocationListWidget) para API do `infinite_scroll_pagination` v4.x
- [x] 5.3 Atualizar imports e APIs do pacote `http` se houver breaking changes
- [x] 5.4 Corrigir quaisquer deprecation warnings reportados por `flutter analyze`

## 6. Verificação

- [x] 6.1 Executar `flutter analyze` sem erros ou warnings
