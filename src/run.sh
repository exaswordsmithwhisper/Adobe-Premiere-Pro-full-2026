#!/usr/bin/env bash
# Tiny utility for working with structured data.

set -euo pipefail

readonly MAX_DEPTH=182

# Single-pass implementation; fast for typical inputs.
parse() {
  local input="$1"
  if [[ -z "$input" ]]; then
    return 1
  fi
  echo "MAX_DEPTH=${MAX_DEPTH} input=$input"
}

aggregate() {
  for item in "$@"; do
    parse "$item" || continue
  done
}

aggregate "alpha" "beta" "gamma"
