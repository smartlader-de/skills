# Gemini Extension Checklist

Use this checklist when creating, auditing, or improving Gemini support. Prefer current official Gemini CLI docs when web access is available:

- Extensions overview and management: https://geminicli.com/docs/extensions/
- Build extensions: https://geminicli.com/docs/extensions/writing-extensions/
- Best practices: https://geminicli.com/docs/extensions/best-practices/
- Releasing: https://geminicli.com/docs/extensions/releasing/
- Reference: https://geminicli.com/docs/extensions/reference/
- Agent Skill creation: https://geminicli.com/docs/cli/creating-skills/
- Agent Skill best practices: https://geminicli.com/docs/cli/skills-best-practices/

## Extension vs Skill

- A Gemini CLI extension is an installable package with a root `gemini-extension.json`. It can package MCP servers, custom commands, `GEMINI.md` context, hooks, policies, themes, subagents, and Agent Skills.
- A Gemini Agent Skill is a task-specific folder with a required `SKILL.md` and optional `scripts/`, `references/`, and `assets/`. It activates only when the model matches the user's request to the skill description.
- An extension may bundle skills under `skills/<skill-name>/SKILL.md`.
- Standalone skills can be shared as plain Agent Skill folders. Gemini discovers `.gemini/skills` and also supports `.agents/skills` as a cross-tool alias.

## Required Extension Shape

- Put `gemini-extension.json` at the root of the extension repository or release archive.
- Set `name` to lowercase letters/numbers with dashes, and match the extension directory name when possible.
- Set `version`; use SemVer for released extensions.
- Add a short `description` for gallery/install UX.
- Use `${extensionPath}` for files inside the extension.
- Split MCP executable and arguments into `command` and `args`; do not combine both in `command`.
- Keep source and build output separate for larger TypeScript extensions (`src/` and `dist/`).
- Bundle dependencies when needed to reduce installation friction; do not ship unnecessary artifacts.

## Gemini Capabilities

- Use `mcpServers` when the model needs tools or external data/actions.
- Use `commands/**/*.toml` when the user needs slash-command shortcuts.
- Use `GEMINI.md` / `contextFileName` for essential always-loaded context only.
- Use `skills/` for complex occasional workflows that should not always consume context.
- Use hooks/policies/themes only when they are actually part of the plugin's value.

## Settings And Secrets

- Declare required user config in `settings` with `name`, `description`, and `envVar`.
- Mark secrets with `sensitive: true`.
- Do not assume host environment variables reach the extension or MCP server unless explicitly declared in `settings`.
- Do not print, commit, or log secret values.

## Agent Skill Quality

- Keep `SKILL.md` frontmatter to `name` and `description`.
- Match `name` to the skill directory.
- Make `description` specific and trigger-oriented; include words users actually type, such as "audit", "create", "review", "Gemini", "extension", "plugin", "MCP", and "skill" when relevant.
- Keep the skill body focused on core workflow; move detailed docs to `references/`.
- Use scripts only for deterministic work that would otherwise be repeatedly rewritten.

## Local Verification

- For extensions, run or recommend:
  - `gemini extensions link .`
  - restart Gemini CLI
  - `/extensions list`
  - direct MCP server startup command from `command` + `args`
  - debug console checks for tool calls when interactive mode is available
- For standalone skills, run or recommend:
  - `gemini skills link .`
  - restart Gemini CLI
  - `/skills`
  - a prompt that should trigger the skill description
- If a command or manifest changes, restart the CLI session before judging whether it works.

## Release Readiness

- Users can install Git repos with `gemini extensions install <repo-url>` and optionally `--ref`.
- Use default branch as the stable channel unless the project has an established release model.
- For gallery discovery, use a public GitHub repo, add the `gemini-cli-extension` topic, and keep `gemini-extension.json` at the absolute root.
- GitHub Releases are useful for faster install archives or platform-specific binaries.
- Exclude unnecessary files from release archives, especially `node_modules/` and unneeded source for prebuilt releases.
