#!/usr/bin/env bash
set -e

# Determine next semver tag from conventional commits since last tag.
# Usage: ./release.sh [--dry-run]

DRY_RUN=false
[[ "${1}" == "--dry-run" ]] && DRY_RUN=true

LAST_TAG=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
if [[ -z "$LAST_TAG" ]]; then
  echo "No previous tag found. Creating v0.1.0 as first release."
  NEXT="v0.1.0"
else
  echo "Last tag: $LAST_TAG"

  COMMITS=$(git log "${LAST_TAG}..HEAD" --pretty=format:"%s")
  if [[ -z "$COMMITS" ]]; then
    echo "No commits since $LAST_TAG. Nothing to release."
    exit 0
  fi

  echo ""
  echo "Commits since $LAST_TAG:"
  echo "$COMMITS" | sed 's/^/  /'
  echo ""

  MAJOR=0; MINOR=0; PATCH=0
  IFS='.' read -r V_MAJOR V_MINOR V_PATCH <<< "${LAST_TAG#v}"

  if echo "$COMMITS" | grep -qE "^(feat|fix|refactor|perf)!:|BREAKING CHANGE:"; then
    MAJOR=1
  elif echo "$COMMITS" | grep -qE "^feat(\(.+\))?:"; then
    MINOR=1
  elif echo "$COMMITS" | grep -qE "^(fix|perf|refactor)(\(.+\))?:"; then
    PATCH=1
  else
    echo "No releasable commits (feat/fix/perf/refactor) found. Nothing to release."
    exit 0
  fi

  if [[ $MAJOR -eq 1 ]]; then
    NEXT="v$((V_MAJOR + 1)).0.0"
  elif [[ $MINOR -eq 1 ]]; then
    NEXT="v${V_MAJOR}.$((V_MINOR + 1)).0"
  else
    NEXT="v${V_MAJOR}.${V_MINOR}.$((V_PATCH + 1))"
  fi
fi

echo "Next version: $NEXT"

if $DRY_RUN; then
  echo "(dry-run) Would create and push tag $NEXT"
  exit 0
fi

read -rp "Create and push tag $NEXT? [y/N] " CONFIRM
if [[ "$CONFIRM" != "y" && "$CONFIRM" != "Y" ]]; then
  echo "Aborted."
  exit 0
fi

git tag -a "$NEXT" -m "release $NEXT"
git push origin "$NEXT"
echo "Released $NEXT"
