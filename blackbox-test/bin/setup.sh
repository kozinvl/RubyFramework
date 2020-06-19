#!/usr/bin/env bash

HERE="$(dirname "$(readlink -f "$0")")"
set -e

echo "$HERE"
cd "$HERE"/..

mkdir -p test-reports


time=3
while [ $time -gt 0 ]
do
    sleep 1s
    echo "$time seconds until blast off"
    time=$(( $time - 1 ))
done


echo "Tests are running from $(pwd)..."
/usr/local/bundle/bin/cucumber ./features/ "$@"