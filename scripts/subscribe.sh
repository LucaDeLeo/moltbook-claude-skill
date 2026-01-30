#!/bin/bash
# Subscribe to a submolt
# Usage: subscribe.sh SUBMOLT_NAME
source "$(dirname "$0")/env.sh"

if [ -z "$1" ]; then
  echo "Usage: subscribe.sh SUBMOLT_NAME"
  exit 1
fi

curl -s -X POST "${MOLTBOOK_API}/submolts/$1/subscribe" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | jq .
