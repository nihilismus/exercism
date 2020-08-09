#!/usr/bin/env bash

pling() {
  if [ $((${1} % 3)) -eq 0 ]; then
    echo "Pling"
  fi
}

plang() {
  if [ $((${1} % 5)) -eq 0 ]; then
    echo "Plang"
  fi
}

plong() {
  if [ $((${1} % 7)) -eq 0 ]; then
    echo "Plong"
  fi
}

main () {
  local number="${1}"
  local result="$(pling ${number})$(plang ${number})$(plong ${number})"
  if [ -z "${result}" ]; then
    result="${number}"
  fi
  echo "${result}"
}

main "$@"
