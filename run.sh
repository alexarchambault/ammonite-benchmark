#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"

if which pbcopy >/dev/null 2>&1; then
  COPY="pbcopy"
elif which xclip >/dev/null 2>&1; then
  COPY="xclip"
else
  echo "Don't know how to copy stuff to clipboard."
  exit 1
fi

./clipboard.sh "$1" | "$COPY"
echo "Copied benchmark input to clipboard."
echo "Paste it in the session below."
echo

case "$1" in
  "ammonite-tty-optim")
    exec coursier launch com.lihaoyi:ammonite_2.12.6:$(ls "$HOME/.ivy2/local/com.lihaoyi/ammonite_2.12.6/" | grep '84d48542$') \
      -M ammonite.Main
    ;;
  "ammonite-optim")
    exec coursier launch com.lihaoyi:ammonite_2.12.6:$(ls "$HOME/.ivy2/local/com.lihaoyi/ammonite_2.12.6/" | grep '9a47943a$') \
      -M ammonite.Main
    ;;
  "ammonite-current")
    exec coursier launch com.lihaoyi:ammonite_2.12.6:1.1.2-30-53edc31 \
      -M ammonite.Main
    ;;
  "default")
    exec java -Dscala.usejavacp=true \
      -cp "$(coursier fetch -p org.scala-lang:scala-compiler:2.12.6)" \
      scala.tools.nsc.MainGenericRunner
    ;;
  other)
    echo "Unrecognized case: $other"
    exit 1
    ;;
esac
