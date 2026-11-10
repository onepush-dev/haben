#!/bin/sh
set -e
mkdir -p /var/lib/haben/belege /var/lib/haben/eric /var/lib/haben/eric-log
chown -R bun:bun /var/lib/haben
# Wait for the database service to accept TCP connections (fresh template deploys start both services together).
if [ -n "$DATABASE_URL" ]; then
  setpriv --reuid=bun --regid=bun --init-groups bun -e '
    const u = new URL(process.env.DATABASE_URL);
    const host = u.hostname, port = Number(u.port || 5432);
    for (let i = 0; i < 90; i++) {
      const ok = await new Promise((r) => { Bun.connect({ hostname: host, port, socket: { open(s) { s.end(); r(true); }, error() { r(false); }, connectError() { r(false); }, data() {} } }).catch(() => r(false)); });
      if (ok) process.exit(0);
      await Bun.sleep(2000);
    }
    console.error("database not reachable at " + host + ":" + port); process.exit(1);
  '
fi
exec setpriv --reuid=bun --regid=bun --init-groups haben-entrypoint "$@"
