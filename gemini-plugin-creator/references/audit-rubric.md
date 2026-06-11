# Gemini Plugin Audit Rubric

Use this rubric for audits and improvement prioritization. Report findings by severity, not by file order.

## Severity

- **Critical**: Gemini cannot load the extension/skill, required tools cannot start, secrets are exposed, or install instructions are unusable.
- **High**: Core Gemini workflow fails after install, required env vars are not declared, command/tool conflicts hide important behavior, or cross-platform code would be broken by the proposed Gemini integration.
- **Medium**: Gemini works but the experience is brittle, hard to discover, missing local validation, overuses always-loaded context, or has weak trigger descriptions.
- **Low**: Polish, naming clarity, docs, release metadata, or minor packaging improvements.

## Categories

1. **Manifest correctness**
   - Root `gemini-extension.json` exists and is valid JSON.
   - `name`, `version`, and `description` are present.
   - `name` is dash-case and matches the extension directory when possible.
   - Paths use `${extensionPath}` for bundled files.

2. **MCP/tool startup**
   - `mcpServers` entries use separate `command` and `args`.
   - `cwd` is set when relative paths or local package behavior require it.
   - The server can start outside Gemini with the same command.
   - Tool names and input schemas are stable and descriptive.

3. **Settings and secrets**
   - Required user-provided values are declared in `settings`.
   - Secrets use `sensitive: true`.
   - No raw secrets appear in docs, manifests, logs, tests, examples, or committed env files.

4. **Context and skill behavior**
   - `GEMINI.md` is concise, goal-oriented, and contains only always-needed context.
   - Bundled skills are under `skills/<skill-name>/SKILL.md`.
   - Skill descriptions are specific enough to trigger only for intended work.
   - Detailed material lives in `references/`, not always-loaded context.

5. **Commands, hooks, policies, and themes**
   - Custom commands are namespaced enough to avoid accidental conflicts.
   - Hooks and policies are documented and scoped to the plugin's purpose.
   - Powerful tools are restricted with `excludeTools` when appropriate.

6. **Cross-platform preservation**
   - Gemini integration is additive or isolated in an adapter.
   - Existing non-Gemini exports, commands, schemas, docs, and install paths remain intact.
   - Shared code changes are justified by a narrow compatibility need.

7. **Release and install readiness**
   - Local verification uses `gemini extensions link .` or `gemini skills link .`.
   - Install docs include `gemini extensions install <repo-url>` or skill install/link instructions.
   - Public extension repos use the `gemini-cli-extension` topic for gallery discovery.
   - Release archives put `gemini-extension.json` at the archive root.

## Finding Template

```markdown
- [Severity] Title
  - Gemini impact:
  - Evidence:
  - Fix:
```

Keep fixes minimal and Gemini-specific unless the user asked for a general plugin review.
