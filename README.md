# skills

A collection of reusable Agent Skills for Claude, Gemini CLI, Codex, and other tools that can load plain `SKILL.md` skill folders. Each skill adds domain-specific knowledge, workflows, and optional tooling.

## Available Skills

| Skill | Description | Requirements |
|-------|-------------|--------------|
| [gemini-plugin-creator](./gemini-plugin-creator/) | Create, audit, and improve plugins/extensions so they work well with Gemini CLI while preserving cross-platform behavior. | Gemini CLI for live verification |
| [1password](./1password/) | Manage 1Password Environments, provider secret sync, SSH keys, Git signing, and SSH server access through secret-safe workflows. | 1Password app/MCP as needed, Node.js 18+ |
| [leantime](./leantime/) | Manage Leantime projects, tickets, users, and comments via the JSON-RPC 2.0 API. | Leantime v3.x instance + API key |
| [ovh-api](./ovh-api/) | Manage OVH Cloud infrastructure (VPS, Dedicated, Public Cloud, DNS, Networking, Backup, Hosting, Licenses, Support) via the OVH v2 REST API. Safety-first: read-only mode default, triple confirmation for destructive ops. | Python 3.8+, OVH account |

## Installation

Install a single skill:

```bash
npx skills add smartlader-de/skills --skill gemini-plugin-creator
```

Install another skill:

```bash
npx skills add smartlader-de/skills --skill ovh-api
```

Gemini CLI can also install or link skills directly:

```bash
gemini skills install https://github.com/smartlader-de/skills --path gemini-plugin-creator
gemini skills link ./gemini-plugin-creator
```

List all available skills:

```bash
npx skills add smartlader-de/skills --list
```

Manual install (copy to your skills directory):

```bash
cp -r gemini-plugin-creator ~/.agents/skills/gemini-plugin-creator
```

Common skill directories:

```bash
# Generic Agent Skills location
cp -r gemini-plugin-creator ~/.agents/skills/gemini-plugin-creator

# Gemini CLI
cp -r gemini-plugin-creator ~/.gemini/skills/gemini-plugin-creator

# Claude
cp -r gemini-plugin-creator ~/.claude/skills/gemini-plugin-creator
```

## Skill Structure

Each skill follows this layout:

```
<skill-name>/
├── SKILL.md           ← Loaded by the agent runtime on invocation (required)
├── README.md          ← User-facing docs
├── scripts/           ← Executable helpers
├── references/        ← Lazy-loaded reference material
└── evals/             ← Test scenarios and trigger queries
```

## Contributing

Each skill directory name must exactly match the `name` field in its `SKILL.md` frontmatter.
