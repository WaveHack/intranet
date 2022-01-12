#!/usr/bin/env bash

BACKUP_FILE="$1"

if [ "$BACKUP_FILE" = "" ] || [ ! -f "$BACKUP_FILE" ]; then
  echo "Usage: $0 <vaultwarden backup zip file>"
  exit 1
fi

docker run \
  --rm \
  -it \
  -e DATA_DIR=/bitwarden/data \
  --mount type=volume,source=vaultwarden_data,target=/bitwarden/data/ \
  --mount type=bind,source=$(pwd),target=/bitwarden/restore/ \
  ttionya/vaultwarden-backup:latest \
  restore \
  --zip-file $BACKUP_FILE
