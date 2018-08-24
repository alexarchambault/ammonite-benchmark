#!/usr/bin/env bash
set -eu

NAME="$1"

WARMING=20
N=100

cat << EOF
val results = new collection.mutable.ListBuffer[Int]
EOF

i=0
TOTAL=$(($WARMING + $N))
while [ $i -lt $TOTAL ]; do
  cat << EOF
val start = java.time.Instant.now()
val a = Iterator.from(10).take(5).toVector // dummy code…
val end = java.time.Instant.now()
{{ val duration = java.time.Duration.between(start, end).toMillis; println(duration); results += duration.toInt }}
EOF
  i=$(($i+1))
done

cat << EOF

java.nio.file.Files.createDirectories(java.nio.file.Paths.get("results"))
java.nio.file.Files.write(java.nio.file.Paths.get("results/$NAME.csv"), results.toList.drop($WARMING).mkString("", "\n", "\n").getBytes("UTF-8"))

EOF
