#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")/results"

exec coursier launch com.lihaoyi:ammonite_2.12.6:1.1.2-30-53edc31 \
  -M ammonite.Main \
  -- \
    ../plot.sc
