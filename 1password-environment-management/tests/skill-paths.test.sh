#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
package_root=$(cd "$script_dir/.." && pwd)

[ -d "$package_root/skills/environments" ] || { echo "FAIL: skills/environments/ missing"; exit 1; }
[ -f "$package_root/skills/environments/SKILL.md" ] || { echo "FAIL: skills/environments/SKILL.md missing"; exit 1; }
[ -f "$package_root/references/vercel.md" ] || { echo "FAIL: references/vercel.md missing"; exit 1; }

echo "PASS: skill paths valid"
