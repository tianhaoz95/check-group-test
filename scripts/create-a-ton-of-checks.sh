#!/bin/sh

create_single_check () {
    curl \
        -X POST \
        -H "Accept: application/vnd.github.v3+json" \
        -H 'authorization: token $GITHUB_TOKEN' \
        https://api.github.com/repos/tianhaoz95/check-group-test/check-runs \
        -d '{"name":"fake_check_$CURRENT_CHECK_ID","head_sha":"$CURRENT_SHA"}'
}

for i in {1..50}
do
    CURRENT_CHECK_ID="$i"
    create_single_check
    sleep 1
done