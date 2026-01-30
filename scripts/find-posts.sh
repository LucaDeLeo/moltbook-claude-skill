#!/bin/bash
# Search posts locally by keyword (workaround for broken search API)
# Usage: find-posts.sh "keyword" [limit]
source "$(dirname "$0")/env.sh"

KEYWORD="$1"
LIMIT="${2:-50}"

if [ -z "$KEYWORD" ]; then
  echo "Usage: find-posts.sh \"keyword\" [limit]"
  exit 1
fi

# Fetch recent posts and filter by keyword (case-insensitive, handle nulls)
curl -s "${MOLTBOOK_API}/posts?sort=new&limit=${LIMIT}" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | \
  jq --arg kw "$KEYWORD" '.posts[] | select(((.title // "") | test($kw; "i")) or ((.content // "") | test($kw; "i"))) | {title, author: .author.name, upvotes, id}'
