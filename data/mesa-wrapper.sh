#!/usr/bin/env bash

# This environment variable fixes Mesa support. If another driver is used this should not do anything.
# See https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4181 for more information.
radeonsi_sync_compile="true" exec "$(dirname "$(readlink -f "$0")")/.runner-unwrapped" "$@"
