# Cross-Platform Boundaries

Use these rules whenever the target plugin supports multiple LLMs, agents, CLIs, editors, or model providers.

## Default Rule

Improve Gemini compatibility without changing non-Gemini behavior. Prefer additive Gemini files and adapters over shared rewrites.

## Safe Gemini-Specific Edits

- Add or update `gemini-extension.json`.
- Add or update `GEMINI.md` when always-loaded Gemini context is needed.
- Add bundled Gemini Agent Skills under `skills/`.
- Add Gemini command files under `commands/`.
- Add Gemini-specific hook, policy, theme, or subagent files.
- Add a Gemini adapter entrypoint that imports existing shared logic.
- Add Gemini install, link, and validation instructions to docs.

## Guarded Shared-Code Edits

Touch shared code only when Gemini cannot work through an adapter. Keep the public interface stable.

Acceptable examples:

- Exporting an existing function so a Gemini adapter can call it.
- Adding a small compatibility wrapper without changing existing behavior.
- Making path/env handling configurable so Gemini can start the same server reliably.

Risky examples requiring explicit justification:

- Renaming tools, commands, package exports, or schema fields.
- Reorganizing package structure for Gemini aesthetics.
- Removing non-Gemini docs, adapters, tests, or examples.
- Changing default behavior for all platforms to satisfy one Gemini workflow.

## Review Questions

Before finalizing a change, answer:

- Is this file loaded only by Gemini, or is it shared?
- Would another agent runtime, editor integration, MCP client, CLI, or direct package user observe a behavior change?
- Can a Gemini adapter solve the issue without touching shared code?
- If shared code must change, is the interface backward compatible?

## Output Requirement

For cross-platform plugins, separate the work into:

- **Gemini-only changes**: extension manifest, Gemini context, Gemini skills, Gemini commands, Gemini adapters, Gemini docs.
- **Shared-code changes**: only the narrow compatibility edits required for Gemini to call existing logic.
- **Preserved surfaces**: package exports, MCP tool names, non-Gemini commands, non-Gemini docs, tests, and install paths that remain unchanged.
