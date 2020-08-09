#!/usr/bin/env bash

set -e
set -u

digits_sum() {
  local number_of_digits="${#1}"
  local total=0
  for ((i=0; i<${number_of_digits}; i++)); do
    local digit="${1:${i}:1}"
    local raised_digit="$(( ${digit} ** ${number_of_digits} ))"
    total="$(( ${total} + ${raised_digit} ))"
  done
  echo "${total}"
}

main () {
  local number="${1}"
  if [ "$(digits_sum ${number})" -eq "${number}" ]; then
    echo "true"
  else
    echo "false"
  fi
}

main "$@"
