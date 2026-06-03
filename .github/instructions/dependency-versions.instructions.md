---
description: "Use when recommending dependencies, code examples, scripts, or setup changes for this repository. Prefer versions and tooling already declared in package.json and packageManager."
name: "Repository Dependency And Tooling Versions"
---
# Version Alignment Guidelines

- Treat package.json as the source of truth for dependency and tooling versions.
- Prefer the existing package manager and version: pnpm@10.34.1.
- Keep recommendations compatible with the current stack unless the user explicitly asks to upgrade.

## Current Baseline

- payload: 1.14
- typescript: ^4.8.4
- react: 18.2.0
- react-dom: 18.2.0
- node server framework: express ^4.17.1
- ts-node: ^9.1.1
- nodemon: ^2.0.6

## How To Apply

- When suggesting install commands, use pnpm and keep package versions compatible with the baseline.
- When suggesting code patterns, avoid APIs that require newer major versions than listed above.
- If a better solution requires newer versions, explicitly call out the required upgrade and separate it as an optional path.
- For Payload guidance, default to Payload v1-compatible conventions.
