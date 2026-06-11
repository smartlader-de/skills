# Gemini Plugin Creator

A generic Agent Skill for creating, auditing, and improving plugins so they work well with Gemini CLI.

Use it when you want an agent to:

- create a Gemini CLI extension or Gemini Agent Skill
- audit an existing Gemini extension for manifest, settings, tool, command, skill, or release problems
- adapt a cross-platform plugin for Gemini without rewriting non-Gemini surfaces
- improve `gemini-extension.json`, `GEMINI.md`, bundled skills, commands, MCP startup, or release instructions

## Install

With the skills installer:

```bash
npx skills add smartlader-de/skills --skill gemini-plugin-creator
```

With Gemini CLI:

```bash
gemini skills install https://github.com/smartlader-de/skills --path gemini-plugin-creator
```

Manual install:

```bash
# Generic Agent Skills location
cp -r gemini-plugin-creator ~/.agents/skills/gemini-plugin-creator

# Gemini CLI
cp -r gemini-plugin-creator ~/.gemini/skills/gemini-plugin-creator

# Claude
cp -r gemini-plugin-creator ~/.claude/skills/gemini-plugin-creator
```

For Gemini CLI local development, you can also link the skill:

```bash
gemini skills link ./gemini-plugin-creator
```

## Contents

- `SKILL.md`: activation metadata and workflow instructions
- `agents/openai.yaml`: optional UI metadata for compatible clients
- `references/gemini-extension-checklist.md`: Gemini extension and Agent Skill compatibility checklist
- `references/audit-rubric.md`: severity model for Gemini plugin audits
- `references/cross-platform-boundaries.md`: rules for preserving non-Gemini behavior

## Portability

The skill is plain Markdown plus optional metadata and references. It has no runtime dependency and no bundled secrets. It is designed to be useful in any LLM agent environment that can read an Agent Skill folder, while using Gemini CLI only for live verification steps.
