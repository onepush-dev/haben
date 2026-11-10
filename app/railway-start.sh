#!/bin/sh
set -e
mkdir -p /var/lib/haben/belege /var/lib/haben/eric /var/lib/haben/eric-log
chown -R bun:bun /var/lib/haben
exec setpriv --reuid=bun --regid=bun --init-groups haben-entrypoint "$@"
