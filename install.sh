#!/usr/bin/env bash
# Install an agent pack (and optionally a project profile) into a project.
#
#   ./install.sh --list
#   ./install.sh <pack> <project-dir> [profile] [--force]
#
# [profile] is a name or a file path. A name is looked up in
#   $PERSONAL_AGENTS_PROFILES/<name>/<pack>.md, then profiles/<name>/<pack>.md
#
# Example:
#   ./install.sh seo ~/path/to/project myproject
#
# Copies agents/<pack>/*.md -> <project-dir>/.claude/agents/
# Copies the profile        -> <project-dir>/.claude/profiles/<pack>.md
# Existing files are never overwritten unless --force is given.
# .claude/profiles/ and .claude/data/ are added to the project's local git
# exclude, so profiles and agent research are not committed by accident.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
PROFILE_DIRS=()
[[ -n "${PERSONAL_AGENTS_PROFILES:-}" ]] && PROFILE_DIRS+=("$PERSONAL_AGENTS_PROFILES")
PROFILE_DIRS+=("$ROOT/profiles")

if [[ "${1:-}" == "--list" || $# -eq 0 ]]; then
  echo "Packs:"
  for d in "$ROOT"/agents/*/; do
    echo "  $(basename "$d"): $(cd "$d" && ls *.md | sed 's/\.md$//' | tr '\n' ' ')"
  done
  echo "Profiles on this machine:"
  found=0
  for base in "${PROFILE_DIRS[@]}"; do
    for d in "$base"/*/; do
      [[ -d "$d" ]] || continue
      [[ "$(basename "$d")" == _template ]] && continue
      echo "  $(basename "$d"): $(cd "$d" && ls *.md 2>/dev/null | sed 's/\.md$//' | tr '\n' ' ')  ($base)"
      found=1
    done
  done
  [[ $found -eq 1 ]] || echo "  none (see profiles/README.md)"
  [[ $# -eq 0 ]] && echo && echo "Usage: ./install.sh <pack> <project-dir> [profile] [--force]"
  exit 0
fi

FORCE=0
ARGS=()
for a in "$@"; do
  if [[ "$a" == "--force" ]]; then FORCE=1; else ARGS+=("$a"); fi
done
PACK="${ARGS[0]:-}"
PROJECT="${ARGS[1]:-}"
PROFILE="${ARGS[2]:-}"

[[ -n "$PACK" && -n "$PROJECT" ]] || { echo "Usage: ./install.sh <pack> <project-dir> [profile] [--force]"; exit 1; }
[[ -d "$ROOT/agents/$PACK" ]] || { echo "No pack '$PACK'. Run ./install.sh --list"; exit 1; }
[[ -d "$PROJECT" ]] || { echo "No project folder: $PROJECT"; exit 1; }

copy() {
  local src="$1" dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && $FORCE -eq 0 ]]; then
    if cmp -s "$src" "$dst"; then
      echo "  same     $dst"
    else
      echo "  SKIPPED  $dst (exists and differs; use --force to overwrite)"
    fi
    return
  fi
  cp "$src" "$dst"
  echo "  copied   $dst"
}

find_profile() {
  if [[ -f "$PROFILE" ]]; then echo "$PROFILE"; return; fi
  for base in "${PROFILE_DIRS[@]}"; do
    if [[ -f "$base/$PROFILE/$PACK.md" ]]; then echo "$base/$PROFILE/$PACK.md"; return; fi
  done
}

echo "Agents ($PACK):"
for f in "$ROOT/agents/$PACK"/*.md; do
  copy "$f" "$PROJECT/.claude/agents/$(basename "$f")"
done

dst="$PROJECT/.claude/profiles/$PACK.md"
if [[ -n "$PROFILE" ]]; then
  src="$(find_profile)"
  [[ -n "$src" ]] || { echo "No profile '$PROFILE' for pack '$PACK'. Looked in: ${PROFILE_DIRS[*]}"; exit 1; }
  echo "Profile ($PROFILE):"
  copy "$src" "$dst"
elif [[ ! -e "$dst" ]]; then
  echo "No profile given. Start one from the template:"
  copy "$ROOT/profiles/_template/$PACK.md" "$dst"
  echo "  -> fill every <…> in $dst before running the agents"
fi

# Keep profiles and agent data out of the project's commits
# (local only; changes no tracked file).
if git -C "$PROJECT" rev-parse --git-dir >/dev/null 2>&1; then
  exclude="$(git -C "$PROJECT" rev-parse --git-path info/exclude)"
  [[ "$exclude" = /* ]] || exclude="$PROJECT/$exclude"
  mkdir -p "$(dirname "$exclude")"
  for path in .claude/profiles/ .claude/data/; do
    if ! grep -qxF "$path" "$exclude" 2>/dev/null; then
      echo "$path" >> "$exclude"
      echo "Git: $path added to $exclude (not committed)"
    fi
  done
fi
