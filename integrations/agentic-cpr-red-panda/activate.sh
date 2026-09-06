#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
MOD="$ROOT/integrations/agentic-cpr-red-panda"
PAYLOAD="$MOD/payload"
RUNTIME="$MOD/runtime"
ZIP="$MOD/.agentic-cpr-red-panda.zip"

printf '🐼 Agentic CPR / Red Panda — activating inside Sonoxomus\n'
cat "$PAYLOAD"/part-00.bin "$PAYLOAD"/part-01.bin "$PAYLOAD"/part-02.bin "$PAYLOAD"/part-03.bin > "$ZIP"
rm -rf "$RUNTIME"
mkdir -p "$RUNTIME"
unzip -q "$ZIP" -d "$RUNTIME"
rm -f "$ZIP"

APP="$RUNTIME/agentic-cpr-red-panda"
if [[ ! -f "$APP/extension/manifest.json" || ! -f "$APP/server/server.js" ]]; then
  echo '❌ Red Panda payload verification failed.' >&2
  exit 1
fi

echo '✅ Red Panda payload restored.'
echo "Chrome extension: $APP/extension"
echo "Runtime server:   $APP/server"

if [[ "${1:-}" == "--install" || "${1:-}" == "--run" ]]; then
  cd "$APP/server"
  [[ -f .env ]] || cp .env.example .env
  npm install
fi

if [[ "${1:-}" == "--run" ]]; then
  cd "$APP/server"
  exec npm start
fi

echo 'Run with --install to install server dependencies, or --run to install and launch Red Panda.'
