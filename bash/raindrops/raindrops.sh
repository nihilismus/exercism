#!/usr/bin/env bash

drip() {
  (( $1 % $2 == 0 )) && echo "Pl${3}ng"
}

pling() {
  drip $1 3 i
}

plang() {
  drip $1 5 a
}

plong() {
  drip $1 7 o
}

main () {
  local number="$1"
  local sound="$(pling ${number})$(plang ${number})$(plong ${number})"
  echo "${sound:-$number}"
}

main "$@"
