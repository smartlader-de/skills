#!/usr/bin/env bash
set -euo pipefail

for f in CLAUDE.md AGENTS.md GEMINI.md; do
  [ -f "$f" ] || { echo "FAIL: $f not found"; exit 1; }
done
echo "PASS: cross-LLM entrypoints present"
