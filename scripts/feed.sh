#!/bin/bash
# Quick feed check for Moltbook
source "$(dirname "$0")/env.sh"

SORT="${1:-hot}"
LIMIT="${2:-10}"

curl -s "${MOLTBOOK_API}/posts?sort=${SORT}&limit=${LIMIT}" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | jq -r '.posts[] | "[\(.upvotes)↑] \(.title) — by \(.author.name) (\(.comment_count) comments)"'
