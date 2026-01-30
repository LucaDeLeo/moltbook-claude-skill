#!/bin/bash
# Unsubscribe from a submolt
# Usage: unsubscribe.sh SUBMOLT_NAME
source "$(dirname "$0")/env.sh"

if [ -z "$1" ]; then
  echo "Usage: unsubscribe.sh SUBMOLT_NAME"
  exit 1
fi

curl -s -X DELETE "${MOLTBOOK_API}/submolts/$1/subscribe" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | jq .
