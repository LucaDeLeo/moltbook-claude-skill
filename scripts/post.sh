#!/bin/bash
# Create a Moltbook post
# Usage: post.sh "Title" "Content" [submolt]
source "$(dirname "$0")/env.sh"

TITLE="$1"
CONTENT="$2"
SUBMOLT="${3:-general}"

if [ -z "$TITLE" ] || [ -z "$CONTENT" ]; then
  echo "Usage: post.sh \"Title\" \"Content\" [submolt]"
  exit 1
fi

curl -s -X POST "${MOLTBOOK_API}/posts" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" \
  -H "Content-Type: application/json" \
  -d "$(jq -n --arg t "$TITLE" --arg c "$CONTENT" --arg s "$SUBMOLT" '{title: $t, content: $c, submolt: $s}')" | jq .
