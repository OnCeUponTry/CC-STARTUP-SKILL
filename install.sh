#!/usr/bin/env bash
# install.sh — install the CC-STARTUP-SKILL skills into ~/.claude/skills/
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/OnCeUponTry/CC-STARTUP-SKILL/main/install.sh | bash
#
# Or, if you already cloned the repo:
#   ./install.sh

set -euo pipefail

REPO="OnCeUponTry/CC-STARTUP-SKILL"
BRANCH="main"
SKILLS_DIR="${HOME}/.claude/skills"

# Detect whether we're running from inside the cloned repo or from a curl pipe.
PLUGIN_PATH="plugins/cc-startup/skills"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
if [ -n "${SCRIPT_DIR}" ] && [ -d "${SCRIPT_DIR}/${PLUGIN_PATH}" ]; then
  SOURCE_DIR="${SCRIPT_DIR}/${PLUGIN_PATH}"
else
  TMPDIR="$(mktemp -d)"
  trap 'rm -rf "${TMPDIR}"' EXIT
  echo "→ Downloading ${REPO} (branch ${BRANCH})..."
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "https://github.com/${REPO}/archive/refs/heads/${BRANCH}.tar.gz" \
      | tar xz -C "${TMPDIR}"
  elif command -v wget >/dev/null 2>&1; then
    wget -qO- "https://github.com/${REPO}/archive/refs/heads/${BRANCH}.tar.gz" \
      | tar xz -C "${TMPDIR}"
  else
    echo "✗ Need curl or wget to download. Install one and retry." >&2
    exit 1
  fi
  SOURCE_DIR="${TMPDIR}/CC-STARTUP-SKILL-${BRANCH}/${PLUGIN_PATH}"
fi

if [ ! -d "${SOURCE_DIR}" ]; then
  echo "✗ Source directory not found: ${SOURCE_DIR}" >&2
  exit 1
fi

mkdir -p "${SKILLS_DIR}"

INSTALLED=()
for skill in "${SOURCE_DIR}"/*/; do
  [ -d "${skill}" ] || continue
  name="$(basename "${skill}")"
  dest="${SKILLS_DIR}/${name}"
  if [ -e "${dest}" ]; then
    echo "→ Updating existing skill: ${name}"
    rm -rf "${dest}"
  else
    echo "→ Installing skill: ${name}"
  fi
  cp -r "${skill}" "${SKILLS_DIR}/"
  INSTALLED+=("${name}")
done

echo
echo "✓ Installed ${#INSTALLED[@]} skill(s) to ${SKILLS_DIR}/"
for name in "${INSTALLED[@]}"; do
  echo "  - ${name}"
done
echo
echo "Verify: open Claude Code and ask 'What skills are available?'"
echo "Invoke directly with /<skill-name>, e.g.:"
for name in "${INSTALLED[@]}"; do
  echo "  /${name}"
done
