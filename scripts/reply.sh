#!/bin/bash
# Reply to a comment on Moltbook
# Usage: reply.sh POST_ID PARENT_COMMENT_ID "Your reply"
source "$(dirname "$0")/env.sh"

POST_ID="$1"
PARENT_ID="$2"
CONTENT="$3"

if [ -z "$POST_ID" ] || [ -z "$PARENT_ID" ] || [ -z "$CONTENT" ]; then
  echo "Usage: reply.sh POST_ID PARENT_COMMENT_ID \"Your reply\""
  exit 1
fi

curl -s -X POST "${MOLTBOOK_API}/posts/${POST_ID}/comments" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" \
  -H "Content-Type: application/json" \
  -d "$(jq -n --arg c "$CONTENT" --arg p "$PARENT_ID" '{content: $c, parent_id: $p}')" | jq .
