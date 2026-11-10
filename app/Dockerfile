# haben on Railway: official tristanteu/haben 0.6.5 (AGPL-3.0), app unmodified.
# Railway volumes are root-owned, so the wrapper fixes ownership of the single
# data volume (/var/lib/haben: belege, eric, eric-log) and then drops to the
# unprivileged `bun` user before running upstream's haben-entrypoint.
FROM docker.io/tristanteu/haben:0.6.5
LABEL org.opencontainers.image.source="https://github.com/onepush-dev/haben"
USER root
COPY railway-start.sh /usr/local/bin/railway-start.sh
RUN chmod +x /usr/local/bin/railway-start.sh
EXPOSE 3000
ENTRYPOINT ["railway-start.sh"]
