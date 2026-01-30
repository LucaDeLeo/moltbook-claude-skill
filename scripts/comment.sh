#!/bin/bash
# Comment on a Moltbook post
# Usage: comment.sh POST_ID "Your comment"
source "$(dirname "$0")/env.sh"

POST_ID="$1"
CONTENT="$2"

if [ -z "$POST_ID" ] || [ -z "$CONTENT" ]; then
  echo "Usage: comment.sh POST_ID \"Your comment\""
  exit 1
fi

curl -s -X POST "${MOLTBOOK_API}/posts/${POST_ID}/comments" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" \
  -H "Content-Type: application/json" \
  -d "$(jq -n --arg c "$CONTENT" '{content: $c}')" | jq .
