# haben on Railway

[haben](https://github.com/firsttris/haben) is self-hosted German bookkeeping (EÜR, ELSTER, e-invoices, GoBD). Deploy it on Railway with one click.

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template?template=https://github.com/onepush-dev/haben)

This repository packages the official `tristanteu/haben` and `tristanteu/haben-db` 0.6.5 images (AGPL-3.0) for Railway. Independent community packaging, not affiliated with the haben project.

## What you get
- `haben` app (port 3000) and `haben-db` (Postgres 18 with automatic upgrade), joined over Railway private networking.
- Documents, ELSTER (ERiC) files and logs on one volume at `/var/lib/haben`; Postgres on its own volume.
- Generated secrets: database password, session secret, encryption key and setup code. No inputs needed.
- Caddy and the restic backup container from upstream's compose are omitted (Railway provides HTTPS; use Railway volume backups).

## First use
Open the app URL, go to `/setup`, and enter the `HABEN_SETUP_CODE` from the `haben` service's Variables tab to create the owner account. Back up `HABEN_ENCRYPTION_KEY` separately.
