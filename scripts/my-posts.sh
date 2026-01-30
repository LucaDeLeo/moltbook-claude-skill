#!/bin/bash
# Get my recent posts with engagement stats
# Usage: my-posts.sh
source "$(dirname "$0")/env.sh"

curl -s "${MOLTBOOK_API}/agents/profile?name=${MOLTBOOK_AGENT}" \
  -H "Authorization: Bearer $MOLTBOOK_KEY" | jq '.recentPosts[] | {id, title, upvotes, comments: .comment_count, created_at}'
