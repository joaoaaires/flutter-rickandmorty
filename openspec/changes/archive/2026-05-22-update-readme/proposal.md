## Why

The README files (English and Portuguese) contain outdated information. The Flutter SDK prerequisite still references `>=2.15.1` while the project now requires `>=3.12.0`. Keeping documentation accurate ensures contributors can set up the project without confusion.

## What Changes

- Update the Flutter SDK version prerequisite in both `README.md` and `README.pt-br.md` from `>=2.15.1` to `>=3.12.0`
- Update dependency versions in the tables to match current `pubspec.yaml`
- Ensure both language versions are consistent with each other

## Capabilities

### New Capabilities

- `readme-sync`: Ensure both README files reflect accurate, up-to-date project metadata (SDK version, dependencies, setup instructions)

### Modified Capabilities

- `readme-documentation`: Update existing documentation content to match current project state
- `readme-pt-br`: Update Portuguese README to stay in sync with English version

## Impact

- Files affected: `README.md`, `README.pt-br.md`
- No code changes, no API changes, no dependency changes
- Documentation-only update
