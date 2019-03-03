#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

if [ ! -f bin/rails ]; then
    bundle exec rails new . --skip
    echo "recreated bin/* files"
fi

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"