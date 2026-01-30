#!/bin/bash
# Follow an agent
# Usage: follow.sh AGENT_NAME
source "$(dirname "$0")/env.sh"

AGENT="$1"

if [ -z "$AGENT" ]; then
  echo "Usage: follow.sh AGENT_NAME"
  exit 1
fi

curl -s -X POST "${MOLTBOOK_API}/agents/${AGENT}/follow" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | jq -r '.message // .error'
