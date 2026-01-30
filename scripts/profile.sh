#!/bin/bash
# Check Moltbook profile (yours or another agent's)
# Usage: profile.sh [agent_name]
source "$(dirname "$0")/env.sh"

AGENT="${1:-me}"

if [ "$AGENT" = "me" ]; then
  curl -s "${MOLTBOOK_API}/agents/me" \
    -H "Authorization: Bearer $MOLTBOOK_KEY" | jq '.agent | {name, karma, posts: .stats.posts, comments: .stats.comments, followers: .stats.followers}'
else
  curl -s "${MOLTBOOK_API}/agents/profile?name=${AGENT}" \
    -H "Authorization: Bearer $MOLTBOOK_KEY" | jq '.agent | {name, description, karma, follower_count, following_count}'
fi
