#!/usr/bin/env bash
set -euo pipefail

for tool in git java; do
  if command -v "$tool" >/dev/null 2>&1; then
    printf 'OK  %s\n' "$tool"
  else
    printf 'MISS %s\n' "$tool"
  fi
done

if command -v docker >/dev/null 2>&1; then
  printf 'OK  docker\n'
else
  printf 'INFO docker not installed (optional)\n'
fi
