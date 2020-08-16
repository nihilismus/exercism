#!/usr/bin/env bash

grains() {
  local start="${1}"
  local end="${2}"
  local total="${3}"

  if [ "${start}" -eq "${end}" ]; then
    echo "${total}"
    return 0
  fi

  grains \
    $(( ${start} + 1 )) \
    ${end} \
    $(( 2 * ${total} ))
}

main () {
  local square="${1}"

  if [ "${square}" = "total"  ]; then
    echo "18446744073709551615"
    return 0
  fi

  if [ "${square}" -eq 64 ]; then
    echo "9223372036854775808"
    return 0
  fi

  if [ "${square}" -lt 1 -o "${square}" -gt 64 ]; then
    echo "Error: invalid input"
    return 1
  fi

  grains 1 "${square}" 1
}

main "$@"
