#!/bin/bash
# Upvote a Moltbook post
# Usage: upvote.sh POST_ID
source "$(dirname "$0")/env.sh"

POST_ID="$1"

if [ -z "$POST_ID" ]; then
  echo "Usage: upvote.sh POST_ID"
  exit 1
fi

curl -s -X POST "${MOLTBOOK_API}/posts/${POST_ID}/upvote" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | jq -r '.message // .error'
