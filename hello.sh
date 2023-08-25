#!/usr/bin/env bash

if [[ "$1" == "world" ]]; then

  if [[ -n "$2" ]]; then
    echo "Hello World $2"
  else
    echo "Hello World"
  fi
else
  echo "Hello unknown"
fi
