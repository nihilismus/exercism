#!/usr/bin/env bash

distance() {
  local total=0
  for (( i = 0; i < ${#1}; i++ )); do
    if [ ${1:$i:1} != ${2:$i:1} ]; then
      total=$((${total} + 1))
    fi
  done
  echo ${total}
}

main () {
  if [ ${#} -ne 2 ]; then
    echo "Usage: ${0} <string1> <string2>"
    return 1
  fi
  if [ ${#1} -ne ${#2} ]; then
    echo "left and right strands must be of equal length"
    return 1
  fi
  distance "${1}" "${2}"
}

main "$@"
