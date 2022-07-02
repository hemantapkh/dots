# https://stackoverflow.com/a/34095276
isThisScriptPiped(){
  if [ ! -f "$0" ] || [ -x "$0" ] && POSIXLY_CORRECT=1 file -- "$0" | grep -Fvq 'text'; then
    if POSIXLY_CORRECT=1 file -i /dev/stdin | grep -Fq 'fifo'; then
      return 0
    fi
  fi
  return 1
}

# Sample call
isThisScriptPiped && echo 'PIPED' || echo 'NOT piped'