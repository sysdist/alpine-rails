#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /data/tmp/pids/server.pid

 #if [ ! -f bin/rails ]; then
 #    bundle install --without development test --binstubs
#     bundle exec rails new . --skip --skip-git --skip-bundle --skip-coffee --skip-spring 
#     echo "recreated bin/* files"
# fi
#bundle exec rails app:update:bin

#export SECRET_KEY_BASE=`bundle exec rake secret`

CONFIG_PATH=/data/options.json
export SECRET_KEY_BASE="$(jq --raw-output '.secret_key_base' $CONFIG_PATH)"
#export SECRET_KEY_BASE=fff
echo "SECRET_KEY_BASE is $SECRET_KEY_BASE"

export RAILS_ENV=production

bundle exec rake db:create

# Then exec the container's main process (what's set as CMD in the Dockerfile).
#exec "$@"

#bundle exec rails server -b 0.0.0.0 -e production 

bundle exec puma -C config/puma.rb
