#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /data/tmp/pids/server.pid

 #if [ ! -f bin/rails ]; then
 #    bundle install --without development test --binstubs
#     bundle exec rails new . --skip --skip-git --skip-bundle --skip-coffee --skip-spring 
#     echo "recreated bin/* files"
# fi
bundle exec rails app:update:bin

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"