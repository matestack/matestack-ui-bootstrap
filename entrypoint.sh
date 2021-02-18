#!/bin/bash
set -e

# bundle install runs initally ON BUILD which installs all required gems
# this creates a Gemfile.lock on the image /app/Gemfile.lock
# mounting a directory without Gemfile.lock on image:/app causes Gemfile.lock to disappear
# therefore:
# If no Gemfile.lock is present, run bundle install again (should be very fast)
if [[ ! -e /app/Gemfile.lock ]]; then
    bundle install
fi

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
