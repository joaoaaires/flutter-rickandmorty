## Context

O projeto usa Flutter 2.x com Dart SDK <3.0.0. Dependências principais:
- `get: ^4.6.1` — GetX 4 é compatível com Flutter 3.x, mas pode precisar de bump
- `http: ^0.13.4` — Precisa ir para ^1.x no Flutter 3.x
- `dartz: ^0.10.1` — Pacote estável, compatível
- `infinite_scroll_pagination: ^3.1.0` — v4.x tem breaking changes na API
- `flutter_lints: ^1.0.0` — Deprecado, substituído por `flutter_lints` 2.x ou `lints`
- `flutter_launcher_icons: ^0.9.1` — Precisa ir para ^0.13+
- `flutter_native_splash: ^2.0.5` — Precisa ir para ^2.3+

Configurações Android usam Gradle antigo. iOS usa deployment target baixo.

## Goals / Non-Goals

**Goals:**
- Projeto compilando e rodando no Flutter 3.29+ (última estável)
- Todas as dependências em versões compatíveis e mantidas
- Código sem warnings de deprecation
- Build funcional em Android, iOS e Web

**Non-Goals:**
- Não migrar de GetX para outro state management
- Não refatorar arquitetura (Clean Architecture permanece)
- Não adicionar features novas
- Não migrar `dartz` para `fpdart` (mudança de API grande, fora do escopo)

## Decisions

1. **Target: Flutter 3.29.x (última estável)** — Ir direto para a última versão ao invés de migração incremental. O projeto é pequeno o suficiente para absorver todas as mudanças de uma vez.

2. **Manter GetX 4.x** — GetX 4.6+ já suporta Flutter 3.x. Apenas fazer bump de minor version. Alternativa descartada: migrar para GetX 5 (ainda em beta/preview).

3. **`http` → versão ^1.x** — O pacote `http` mudou para 1.x com breaking changes mínimos (Client API permanece). Alternativa: `dio` — descartada por ser mudança de escopo maior.

4. **`infinite_scroll_pagination` → v4.x** — A v4 mudou a API dos builders. Será necessário atualizar os widgets de lista. Mudança localizada nas 3 list widgets.

5. **Lints: `flutter_lints` → `flutter_lints` 3.x ou `lints`** — Usar `flutter_lints: ^3.0.0` que é o pacote oficial atualizado.

6. **Android: compileSdk 34+, minSdk 21, Gradle 8.x** — Seguir recomendações do Flutter 3.29 para Android.

7. **iOS: deployment target 12.0** — Mínimo recomendado pelo Flutter 3.x.

8. **Constructors: migrar para `super.key`** — Dart 3 permite `super.key` ao invés de `Key? key` + `super(key: key)`. Aplicar em todos os widgets.

## Risks / Trade-offs

- [GetX pode ter incompatibilidades sutis] → Testar navegação e bindings após upgrade. GetX 4.6+ é amplamente usado com Flutter 3.x.
- [infinite_scroll_pagination v4 muda API] → Mudança localizada em 3 widgets. Impacto controlado.
- [Gradle upgrade pode quebrar build Android] → Seguir migration guide oficial do Flutter. Rollback: reverter android/ do git.
- [Podfile/iOS pode ter issues com Xcode novo] → Regenerar ios/ com `flutter create . --platforms ios` se necessário.
