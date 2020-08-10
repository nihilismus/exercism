#!/usr/bin/env bash

is_questioning() {
  local string="${1}"
  local trimmed_string="${string%"${string##*[![:space:]]}"}"
  [[ "${trimmed_string}" =~ ^.*\?$ ]]
}

contains_at_least_one_letter() {
  local string="${1}"
  local uppercase_string="${string^^}"
  local matched_substring_length="$(expr match "${uppercase_string}" '.*[A-Z]')"
  [[ "${matched_substring_length}" -gt 0 ]]
}

contains_at_least_one_number() {
  local string="${1}"
  local matched_substring_length="$(expr match "${string}" '.*[0-9]')"
  [[ "${matched_substring_length}" -gt 0 ]]
}

is_yelling() {
  local string="${1}"
  ! contains_at_least_one_letter "${string}" && return 1
  local uppercase_string="${string^^}"
  [[ "${string}" = "${uppercase_string}" ]]
}

answer_when_just_questioning() {
  local string="${1}"
  ! is_yelling "${string}" \
    && is_questioning "${string}" \
    && echo "Sure." \
    && exit 0
}

answer_when_just_yelling() {
  local string="${1}"
  ! is_questioning "${string}" \
    && is_yelling "${string}" \
    && echo "Whoa, chill out!" \
    && exit 0
}

answer_when_yelling_and_questioning() {
  local string="${1}"
  is_questioning "${string}" \
    && is_yelling "${string}" \
    && echo "Calm down, I know what I'm doing!" \
    && exit 0
}

answer_when_just_silence() {
  local string="${1}"
  ! is_questioning "${string}" \
    && ! contains_at_least_one_letter "${string}" \
    && ! contains_at_least_one_number "${string}" \
    && echo "Fine. Be that way!" \
    && exit 0
}

answer_anything() {
  echo "Whatever."
  exit 0
}

main () {
  local message="${1}"
  # The order of execution of these 'answer_when' is interchangeable...
  answer_when_just_questioning "${message}"
  answer_when_just_yelling "${message}"
  answer_when_yelling_and_questioning "${message}"
  answer_when_just_silence "${message}"
  # ... except for this one: poor man's "Chain of Responsibility" pattern desing.
  answer_anything "${message}"
}

main "$@"
