#!/usr/bin/env bash
# Write the files changed by the triggering push/pull_request event as a JSON
# array to ${HOME}/files.json (read by set_matrix.py and check-urls.py).
# Requires GH_TOKEN, GITHUB_REPOSITORY, GITHUB_EVENT_NAME and GITHUB_EVENT_PATH.

set -euo pipefail

if [ "${GITHUB_EVENT_NAME}" = "pull_request" ]; then
  pr=$(jq -r '.pull_request.number' "${GITHUB_EVENT_PATH}")
  gh api --paginate "repos/${GITHUB_REPOSITORY}/pulls/${pr}/files" --jq '.[].filename' > files.txt
else
  before=$(jq -r '.before' "${GITHUB_EVENT_PATH}")
  after=$(jq -r '.after' "${GITHUB_EVENT_PATH}")
  if [[ "${before}" =~ ^0+$ ]]; then
    # new branch or tag: no base to compare against, use the head commit only
    gh api "repos/${GITHUB_REPOSITORY}/commits/${after}" --jq '.files[].filename' > files.txt
  else
    gh api "repos/${GITHUB_REPOSITORY}/compare/${before}...${after}" --jq '.files[].filename' > files.txt
  fi
fi

jq -R -s -c 'split("\n") | map(select(length > 0))' files.txt > "${HOME}/files.json"
rm files.txt
cat "${HOME}/files.json"
