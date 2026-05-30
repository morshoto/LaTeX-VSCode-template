#!/usr/bin/env bash
set -euo pipefail

ACTION="${1:-}"
EXTENSION_ID="james-yu.latex-workshop"

usage() {
  cat <<'EOF'
Usage: vscode-extensions.sh <install|uninstall|status>
EOF
}

find_code_cmd() {
  if command -v code >/dev/null 2>&1; then
    echo code
    return 0
  fi

  if command -v code-insiders >/dev/null 2>&1; then
    echo code-insiders
    return 0
  fi

  if command -v codium >/dev/null 2>&1; then
    echo codium
    return 0
  fi

  return 1
}

code_cmd="$(find_code_cmd || true)"

if [[ -z "${code_cmd}" ]]; then
  echo "No VS Code CLI found on PATH. Install the \`code\` command first." >&2
  exit 1
fi

case "${ACTION}" in
  install)
    "${code_cmd}" --install-extension "${EXTENSION_ID}" --force
    ;;
  uninstall)
    "${code_cmd}" --uninstall-extension "${EXTENSION_ID}"
    ;;
  status)
    if "${code_cmd}" --list-extensions | grep -Fxq "${EXTENSION_ID}"; then
      echo "installed"
    else
      echo "not installed"
    fi
    ;;
  *)
    usage >&2
    exit 1
    ;;
esac
