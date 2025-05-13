#!/bin/bash

set -e

BASE_DIR="/mnt/media"
CONFIG_DIRS=(
  radarr
  sonarr
  sabnzbd
  plex
  overseerr
  tautulli
)
MEDIA_DIRS=(
  "$BASE_DIR/movies"
  "$BASE_DIR/tv"
  "$BASE_DIR/downloads"
  "$BASE_DIR/incomplete-downloads"
)

# make a .env file if it's not already there
if [ ! -f .env ]; then
  echo "creating default .env file..."
  cat <<EOF > .env
PUID=$(id -u)
PGID=$(id -g)
TZ=America/Los_Angeles
EOF
  echo ".env file created with your user info."
fi

# make sure the config folders exist
echo "making sure config folders exist..."
for dir in "${CONFIG_DIRS[@]}"; do
  mkdir -p "$BASE_DIR/config/$dir"
done

# make sure the media and download folders are there too
echo "making sure media folders exist..."
for dir in "${MEDIA_DIRS[@]}"; do
  mkdir -p "$dir"
done

# start everything up
echo "bringing up the docker stack..."
docker compose up -d

# print out where you can find everything
HOSTNAME=$(hostname -I | awk '{print $1}')

echo
echo " arr stack is up and running!"
echo
echo " access services here:"
echo "--------------------------------------------"
printf "%-12s %-40s\n" "service" "url"
echo "--------------------------------------------"
printf "%-12s http://%s:7878\n" "radarr" "$HOSTNAME"
printf "%-12s http://%s:8989\n" "sonarr" "$HOSTNAME"
printf "%-12s http://%s:8080\n" "sabnzbd" "$HOSTNAME"
printf "%-12s http://%s:32400/web\n" "plex" "$HOSTNAME"
printf "%-12s http://%s:5055\n" "overseerr" "$HOSTNAME"
printf "%-12s http://%s:8181\n" "tautulli" "$HOSTNAME"
echo "--------------------------------------------"
echo
