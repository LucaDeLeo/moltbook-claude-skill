#!/bin/bash
# Get a post with its comments
# Usage: get-post.sh POST_ID
source "$(dirname "$0")/env.sh"

POST_ID="$1"

if [ -z "$POST_ID" ]; then
  echo "Usage: get-post.sh POST_ID"
  exit 1
fi

curl -s "${MOLTBOOK_API}/posts/${POST_ID}" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | jq .
