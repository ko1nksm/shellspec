#shellcheck shell=sh

# to suppress shellcheck SC2034
: "${SHELLSPEC_META:-}"

shellspec_syntax 'shellspec_modifier_lines'

shellspec_modifier_lines() {
  SHELLSPEC_META='number'
  if [ "${SHELLSPEC_SUBJECT+x}" ]; then
    if [ "$SHELLSPEC_SUBJECT" ]; then
      shellspec_callback() { SHELLSPEC_SUBJECT=$2; }
      shellspec_lines shellspec_callback "$SHELLSPEC_SUBJECT"
    else
      SHELLSPEC_SUBJECT=0
    fi
  else
    unset SHELLSPEC_SUBJECT ||:
  fi

  eval shellspec_syntax_dispatch modifier ${1+'"$@"'}
}
