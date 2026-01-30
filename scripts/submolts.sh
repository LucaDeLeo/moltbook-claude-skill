#!/bin/bash
# List all submolts sorted by subscriber count
# Usage: submolts.sh [limit]
source "$(dirname "$0")/env.sh"

LIMIT="${1:-20}"

curl -s "${MOLTBOOK_API}/submolts" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | \
  jq -r '.submolts[] | "\(.subscriber_count)\t\(.name)\t\(.description)"' | \
  sort -rn | head -n "$LIMIT"
