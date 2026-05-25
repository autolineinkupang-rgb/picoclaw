#!/bin/sh
set -e

# Copy config from app to picoclaw home
mkdir -p "${HOME}/.picoclaw"
cp /app/config/config.json "${HOME}/.picoclaw/config.json"

# Remove stale PID file from a previous container run.
rm -f "${HOME}/.picoclaw/.picoclaw.pid"

exec picoclaw gateway "$@"#!/bin/sh
set -e

# Copy config from app to picoclaw home
mkdir -p "${HOME}/.picoclaw"
cp /app/config/config.json "${HOME}/.picoclaw/config.json"

# Remove stale PID file from a previous container run.
rm -f "${HOME}/.picoclaw/.picoclaw.pid"

exec picoclaw gateway "$@"
