#!/usr/bin/env bash

if [[ "$1" == "world" ]]; then
  if [[ -n "$2" ]]; then
    echo "Goodbye World $2"
  else
    echo "Goodbye World"
  fi
else
  echo "Goodbye unknown"
fi
