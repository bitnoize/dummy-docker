#!/bin/sh

set -e

if [ "$(id -u)" = "0" ]; then
  if [ -n "$UID" ] && [ ! "$UID" = "$(id office -u)" ]; then
    usermod -u "$UID" office
  fi

  if [ -n "$GID" ] && [ ! "$GID" = "$(id office -g)" ]; then
    groupmod -g "$GID" office
  fi

  chown office:office /var/lib/office

  if [ -d "/lib/entrypoint" ]; then
    run-parts -v --regex '.*sh$' /lib/entrypoint
  fi

  exec gosu office "$@"
else
  exec "$@"
fi

