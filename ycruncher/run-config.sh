#!/usr/bin/env bash
# Re-run the VT3 soak with the same settings every time.
set -euo pipefail

cd -- "$(dirname -- "$0")"

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <config-file>" >&2
  exit 1
fi

CONFIG="$1"
CONFIG_NAME="${CONFIG##*/}"
CONFIG_NAME="${CONFIG_NAME%.cfg}"
LOG="../logs/${CONFIG_NAME}_$(date +%Y%m%d_%H%M).log"

../y-cruncher \
  skip-warnings \
  pause:-2 \
  priority:0 \
  PII:1 \
  logfile:"$LOG" \
  config "$CONFIG"
