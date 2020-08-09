#!/usr/bin/env bash

set -e

trimmed_string() {
  local string="${1}"
  local character="${2}"
  echo "${string//${character}/}"
}

is_a_pangram() {
  local string="${1}"
  local string_length="${#string}"
  local alphabet=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  local minimal_number_of_characters="${#alphabet[@]}"
  if [ "${string_length}" -lt ${minimal_number_of_characters} ]; then
    return 1
  fi
  for character in ${alphabet[@]}; do
    trimmed_string="$(trimmed_string "${string}" "${character}")"
    trimmed_string_length="${#trimmed_string}"
    if [ ${trimmed_string_length} -eq ${string_length} ]; then
      return 1
    fi
  done
  return 0
}

main () {
  local lowercase_string="${1,,}"
  if is_a_pangram "${lowercase_string}"; then
    echo "true"
  else
    echo "false"
  fi
}

main "$@"
