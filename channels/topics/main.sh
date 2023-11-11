#!/bin/bash

function log {
    echo "$(date "+%Y-%m-%d %H:%M:%S") [$0] $1 $2" >&2
}

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

url="$1" && [[ -n "$url" ]] || {
    log ERROR "must provide url"
    exit 1
}
content_video=$2 && [[ -n "$content_video" ]] || {
    log ERROR "must provide content video"
    exit 1
}

answer_info="$(mktemp)"
"${SCRIPT_DIR}/get_zhihu_answer.sh" "$url" >"$answer_info" || {
    log ERROR "get zhihu answer info failed"
    exit 1
}
jq -er '.content' "$answer_info" >content.txt
"${SCRIPT_DIR}/gen_video.sh" \
    "$(jq -er '.title' "$answer_info")" \
    "$(jq -er '.author' "$answer_info")" \
    "$(jq -er '.url' "$answer_info")" \
    content.txt \
    "$content_video" || {
    log ERROR "gen video failed"
    exit 1
}
