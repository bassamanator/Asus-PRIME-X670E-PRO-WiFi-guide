#!/usr/bin/env bash
# Re-run the VT3 soak with the same settings every time.
set -euo pipefail

cd -- "$(dirname -- "$0")"
LOG="../logs/vt3_$(date +%Y%m%d_%H%M).log"

../y-cruncher \
  skip-warnings \
  pause:-2 \
  priority:0 \
  logfile:"$LOG" \
  config VT3.cfg
