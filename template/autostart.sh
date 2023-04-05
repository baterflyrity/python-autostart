#!/usr/bin/env sh

# This script is executed on container start.

# Several services can be executed in background on start via &.
# Example:
# /my/service1 &
# /my/service2 &
# =================Insert your command below====================








# =================Insert your command above====================


# Run commands from environment variable AUTOSTART
/autostart.py
# Run rest commands, e.g. /bin/sh, to prevent container from exit
exec "$@"
