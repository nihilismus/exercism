#!/usr/bin/env bash

set -o noglob

main () {
  local input="$(echo ${1} | tr '-' ' ' | tr '_' ' ' | tr '*' ' ')"
  local output=""
  for word in ${input}; do
    local character=$(echo ${word:0:1} | tr '[a-z]' '[A-Z]')
    output="${output}${character}"
  done
  echo "${output}"
}

main "$@"
