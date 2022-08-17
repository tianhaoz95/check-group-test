#!/bin/sh

echo "head sha: $GITHUB_SHA"

create_single_check () {
    curl \
        -X POST \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/repos/tianhaoz95/check-group-test/check-runs \
        -d '{"name":"fake_check_$CURRENT_CHECK_ID","head_sha":"$GITHUB_SHA"}'
}

for i in {1..100}
do
    CURRENT_CHECK_ID="$i"
    create_single_check
    sleep 1
done