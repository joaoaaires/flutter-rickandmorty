## Context

Both `README.md` (English) and `README.pt-br.md` (Portuguese) currently state the Flutter SDK prerequisite as `>=2.15.1`. The project's `pubspec.yaml` specifies `sdk: ">=3.12.0 <4.0.0"`. The dependency version table also needs updating to reflect current pinned versions in pubspec.yaml.

## Goals / Non-Goals

**Goals:**
- Update SDK version in both READMEs to match pubspec.yaml (`>=3.12.0`)
- Update dependency version numbers in the tables to match current pubspec.yaml
- Keep both language versions consistent

**Non-Goals:**
- Restructuring README content or layout
- Adding new documentation sections
- Changing any project code or dependencies

## Decisions

- **Direct text replacement**: Simple find-and-replace of version strings. No tooling or automation needed since this is a two-file, documentation-only change.
- **Version source of truth**: Use `pubspec.yaml` as the authoritative source for all version numbers.
- **No version pinning in README**: Keep the `>=X.Y.Z` format for SDK prerequisite (matches pubspec convention).

## Risks / Trade-offs

- [Low risk] Future version bumps will require manual README updates → Accept; this is standard for documentation.
- [No risk] No code changes, no runtime impact.
