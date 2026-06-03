# skills

A collection of reusable Claude agent skills. Each skill extends Claude with domain-specific knowledge and tooling.

## Available Skills

| Skill | Description | Requirements |
|-------|-------------|--------------|
| [1password](./1password/) | Manage 1Password Environments, provider secret sync, SSH keys, Git signing, and SSH server access through secret-safe workflows. | 1Password app/MCP as needed, Node.js 18+ |
| [leantime](./leantime/) | Manage Leantime projects, tickets, users, and comments via the JSON-RPC 2.0 API. | Leantime v3.x instance + API key |
| [ovh-api](./ovh-api/) | Manage OVH Cloud infrastructure (VPS, Dedicated, Public Cloud, DNS, Networking, Backup, Hosting, Licenses, Support) via the OVH v2 REST API. Safety-first: read-only mode default, triple confirmation for destructive ops. | Python 3.8+, OVH account |

## Installation

Install a single skill:

```bash
npx skills add smartlader-de/skills --skill 1password
```

For example, to install another skill:

```bash
npx skills add smartlader-de/skills --skill ovh-api
```

List all available skills:

```bash
npx skills add smartlader-de/skills --list
```

Manual install (copy to your skills directory):

```bash
cp -r ovh-api ~/.claude/skills/ovh-api
```

## Skill Structure

Each skill follows this layout:

```
<skill-name>/
├── SKILL.md           ← Loaded by Claude on invocation (required)
├── README.md          ← User-facing docs (not loaded by Claude)
├── scripts/           ← Executable helpers
├── references/        ← Lazy-loaded reference material
└── evals/             ← Test scenarios and trigger queries
```

## Contributing

Each skill directory name must exactly match the `name` field in its `SKILL.md` frontmatter.
