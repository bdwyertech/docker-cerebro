#!/bin/sh
set -e

# Generate a Random
if [ -z ${CEREBRO_SECRET+x} ]; then
  echo 'CEREBRO_SECRET not provided... Generating Randomly...'
  export CEREBRO_SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9~!@#$%^&*_-' | fold -w ${1:-64} | head -n 1)
fi

# Deploy any Configuration Templates
confd -onetime -backend env

# Launch Cerebro
su-exec cerebro ./bin/cerebro
