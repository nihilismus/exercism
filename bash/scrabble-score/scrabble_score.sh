#!/usr/bin/env bash

set -e

scrabble_score() {
  local string="${1}"
  local string_length="${#string}"
  local alphabet="abcdefghijklmnopqrstuvwxyz"
  local values=( 0 1 3 3 2 1 4 2 4 1 8 5 1 3 1 1 3 10 1 1 1 1 4 4 8 4 10 )
  local total=0
  for (( i = 0; i < "${string_length}"; i++ )); do
    local character="${string:$i:1}"
    local character_index="$(expr index "${alphabet}" "${character}")"
    local value=${values[${character_index}]}
    total=$(( ${total} + ${value} ))
  done
  echo "${total}"

}

main () {
  local lowercase_string="${1,,}"
  scrabble_score "${lowercase_string}"
}

main "$@"
