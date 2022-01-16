#!/usr/bin/env sh

if [ $# -ne 3 ]; then
  echo "Usage: $0 <container> <volume> <zipfile>"
  echo
  echo "  container  Container name to stop before restoring (eg: vaultwarden)"
  echo "  volume     Volume to overwrite (eg: vaultwarden_data)"
  echo "  zipfile    Path to zip zipfile (eg: vaultwarden-backup-zip)"
  exit 1
fi

container=$1
volume=$2
zipfile=$3

if [ ! "$(docker container inspect \"$container\" >/dev/null 2>&1)" ]; then
  echo "Docker container $container not found"
  exit 1
fi

if [ ! "$(docker volume inspect \"$volume\" >/dev/null 2>&1)" ]; then
  echo "Docker volume $volume not found"
  exit 1
fi

if [ ! -f "$zipfile" ]; then
  echo "Cannot find $zipfile"
  exit 1
fi

echo "Stopping container $container"
docker stop "$container"

tmpdir=$(mktemp -d)

unzip -d "$tmpdir" "$zipfile"

docker run \
  --rm \
  --volume=$tmpdir/:/backup/zipfile/:ro \
  --volume=$volume:/backup/volume/ \
  busybox:latest \
  rm -rf /backup/volume/\* && cp -R /backup/zipfile/\* /backup/volume/

rm -rf "$tmpdir"

echo "Starting container $container"
docker start "$container"
