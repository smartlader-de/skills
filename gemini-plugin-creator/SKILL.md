---
name: gemini-plugin-creator
description: Create, audit, evaluate, and improve plugins, extensions, MCP/tool packages, command packs, and Agent Skills for Gemini CLI compatibility. Use when the user asks to make a plugin work with Gemini, add Gemini CLI support to a cross-platform plugin, review a Gemini extension, fix gemini-extension.json, improve GEMINI.md, package bundled skills, prepare release/install instructions, or preserve non-Gemini surfaces while improving Gemini-specific integration.
---

# Gemini Plugin Creator

## Overview

Create and improve Gemini-facing plugin integration without rewriting unrelated platform surfaces. Treat "plugin" broadly: a Gemini CLI extension, an Agent Skill, an MCP server package, a slash-command pack, a hook/policy/theme bundle, or a cross-platform package with a Gemini adapter.

## First Pass

Before proposing or editing anything:

1. Inspect the current package shape. Look for `gemini-extension.json`, `GEMINI.md`, `skills/*/SKILL.md`, `commands/**/*.toml`, `hooks/hooks.json`, `policies/*.toml`, `package.json`, `src/`, `dist/`, MCP server entrypoints, and other platform adapters.
2. Classify the task:
   - **Create**: build a new Gemini-compatible extension, skill, or adapter.
   - **Audit**: report Gemini-specific problems and missing release/test steps.
   - **Improve**: make the smallest Gemini-specific changes that solve the issue.
3. If the plugin is cross-platform, read `references/cross-platform-boundaries.md` before recommending edits.
4. Read `references/gemini-extension-checklist.md` for Gemini CLI rules. For audits, also read `references/audit-rubric.md`.

## Create Workflow

Choose the smallest Gemini surface that matches the user's goal:

- Use a **Gemini CLI extension** when the result needs installability, MCP servers/tools, slash commands, hooks, policies, themes, subagents, context, settings, or release through `gemini extensions`.
- Use a **Gemini Agent Skill** when the result is specialized model behavior, procedural expertise, task-specific references, or reusable workflows that should activate only when relevant.
- Bundle a skill inside an extension when users need both installable packaging and specialized agent behavior.
- For cross-platform plugins, add a Gemini adapter or wrapper instead of reshaping shared package architecture.

Creation output must include:

- Target artifact type and rationale.
- File tree with required Gemini files.
- Exact Gemini-specific interfaces to add.
- Local validation commands, including `gemini extensions link .` for extensions or `gemini skills link .` / `/skills` checks for standalone skills when applicable.
- Release/install notes if the user asks to share the plugin.

## Audit Workflow

Lead with findings, ordered by severity. Each finding must include:

- Severity: Critical, High, Medium, Low.
- Gemini impact: loading, activation, tool availability, secrets, command conflicts, release, or UX.
- Evidence from files or observed behavior.
- Minimal remediation that preserves non-Gemini code.

Do not turn an audit into broad refactoring advice. If a problem is not Gemini-specific, mention it only when it blocks Gemini support or the user explicitly asked for general plugin quality.

## Improve Workflow

When implementing or proposing improvements:

- Separate **Gemini-only edits** from **shared-code edits**.
- Prefer additive files: `gemini-extension.json`, `GEMINI.md`, `skills/<name>/SKILL.md`, `commands/`, Gemini adapter entrypoints, or release metadata.
- Preserve non-Gemini commands, package exports, schemas, MCP tool names, config files, and documented install flows unless a narrow compatibility fix requires touching them.
- If shared code must change, keep the interface stable and explain why a Gemini adapter cannot solve it.
- Validate with the package's existing tests plus Gemini-specific checks from the checklist.

## Output Formats

For creation:

```markdown
## Gemini Target
## File Tree
## Files / Interfaces
## Validation
## Release Notes
```

For audits:

```markdown
## Findings
## Open Questions
## Suggested Fix Order
## Validation
```

For improvements:

```markdown
## Gemini-Only Changes
## Shared-Code Changes
## Validation
## Residual Risk
```

## References

- `references/gemini-extension-checklist.md`: Gemini CLI extension and Agent Skill compatibility rules.
- `references/audit-rubric.md`: Severity model and review categories.
- `references/cross-platform-boundaries.md`: Rules for preserving non-Gemini plugin surfaces.
