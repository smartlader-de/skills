# 1password

1Password skill collection for agent-safe credential workflows.

This collection contains two nested skills:

| Skill | Use For |
|---|---|
| `1password:environments` | Project environment variables, `.env` import, provider secret audit/sync, local runtime injection, 1Password MCP setup |
| `1password:ssh-git` | SSH key generation, GitHub/GitLab public-key registration, Git commit signing, SSH server access through the 1Password SSH agent |

## Install

From the dedicated 1Password skill repository:

```bash
npx skills add smartlader-de/1password-skill
```

From the full skills collection:

```bash
npx skills add smartlader-de/skills --skill 1password
```

Manual install:

```bash
cp -r skills/1password ~/.claude/skills/1password
```

For Codex or other agents that use an installed skills directory, copy the
folder to the runtime's skills location and load the nested skill that matches
the task.

## Invocation

Use `1password:environments` for:

- importing dotenv files into 1Password Environments
- auditing drift between 1Password and Netlify, Cloudflare, or Vercel
- syncing provider secret names and values through guarded workflows
- running local commands with `op run --environment`
- configuring or using the 1Password MCP server
- generating infrastructure secrets into 1Password Environments

Use `1password:ssh-git` for:

- generating SSH keypairs stored in 1Password
- registering public keys with GitHub or GitLab
- configuring Git SSH commit signing
- routing server SSH access through the 1Password SSH agent

The root `SKILL.md` is a routing entrypoint. The actionable instructions live in
`skills/environments/SKILL.md` and `skills/ssh-git/SKILL.md`.

## Safety Model

The collection is metadata-first:

- environment workflows report variable names, contexts, and sync status only
- raw secret values are never printed, pasted, logged, hashed, or diffed by default
- private SSH key material is never printed and is not passed as a command-line argument
- public SSH keys may be displayed for provider registration
- provider writes, overwrites, deletes, MCP configuration, vault/item writes, and SSH/Git config changes require explicit confirmation

When 1Password MCP is available, `1password:environments` prefers it for
Environment management because it can perform metadata operations without
returning secret values to the agent.

## Included Files

```text
SKILL.md
CLAUDE.md
AGENTS.md
GEMINI.md
skills/
├── environments/SKILL.md
└── ssh-git/SKILL.md
references/
scripts/
tests/
```

## Test

```bash
npm test
```

The test suite validates entrypoint files, nested skill paths, dotenv parsing,
metadata-only name comparison, account-binding checks, and redaction helpers.
