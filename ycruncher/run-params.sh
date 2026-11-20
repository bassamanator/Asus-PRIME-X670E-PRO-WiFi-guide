#!/usr/bin/env bash
# Re-run the selected stress tests with the same settings every time.
set -euo pipefail

cd -- "$(dirname -- "$0")"

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <test-name> [test-name ...]" >&2
  exit 1
fi

TEST_NAMES=("$@")
TEST_LOG_NAME=""
for TEST_NAME in "${TEST_NAMES[@]}"; do
  if [[ -n "$TEST_LOG_NAME" ]]; then
    TEST_LOG_NAME+="_"
  fi
  TEST_LOG_NAME+="$TEST_NAME"
done

LOG="../logs/${TEST_LOG_NAME}_$(date +%Y%m%d_%H%M).log"

../y-cruncher \
  skip-warnings \
  pause:-2 \
  priority:0 \
  PII:1 \
  logfile:"$LOG" \
  stress -M:18379987200 -D:180 -TL:14400 "${TEST_NAMES[@]}"
