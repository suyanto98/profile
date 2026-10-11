#!/usr/bin/env bash
# Upload halaman profil ke VM lalu reload edge Caddy (graceful, aplikasi lain tidak terputus).
#   ./deploy.sh <host>
set -euo pipefail
HOST=${1:?usage: deploy.sh <host>}
USER_AT=${DEPLOY_USER:-deploy}@${HOST}
EDGE=${EDGE_CONTAINER:-ledgerpay-prod-edge-1}
cd "$(dirname "$0")"
tar -c site profile.caddy | ssh -o BatchMode=yes "$USER_AT" "set -e
  rm -rf /tmp/profile-upload && mkdir -p /tmp/profile-upload && tar -x -C /tmp/profile-upload
  rm -rf /srv/edge/sites/profile.new && mv /tmp/profile-upload/site /srv/edge/sites/profile.new
  rm -rf /srv/edge/sites/profile && mv /srv/edge/sites/profile.new /srv/edge/sites/profile
  install -m 644 /tmp/profile-upload/profile.caddy /srv/edge/sites/profile.caddy
  docker exec $EDGE caddy reload --config /etc/caddy/Caddyfile --adapter caddyfile"
echo "OK — https://suyantolabs.my.id"
