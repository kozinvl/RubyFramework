#!/usr/bin/env bash

mkdir -p ../test-reports
echo "Cucumber Tests are running from $(pwd)..."
gem install cucumber
cucumber --tag @system
