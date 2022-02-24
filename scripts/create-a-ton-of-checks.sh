#!/bin/sh

CURRENT_SHA=${{ github.event.workflow_run.head_commit.id }}

function create_single_check {
    curl \
        -X POST \
        -H "Accept: application/vnd.github.v3+json" \
        --header 'authorization: Bearer ${{ secrets.GITHUB_TOKEN }}' \
        --header 'content-type: application/json' \
        https://api.github.com/repos/${{ github.repository }}/check-runs \
        -d '{"name":"fake_check_$CURRENT_CHECK_ID","head_sha":"$CURRENT_SHA"}'
}

for i in {1..50}
do
    CURRENT_CHECK_ID="$i"
    create_single_check
done