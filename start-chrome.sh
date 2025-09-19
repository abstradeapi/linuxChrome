#!/usr/bin/env bash
set -e


sudo apt-get update
sudo apt-get install -y docker.io
sudo service docker start || true


mkdir -p /workspace/chrome-config


sudo docker rm -f chrome || true


sudo docker pull lscr.io/linuxserver/chrome:latest
sudo docker run -d \
--name=chrome \
--security-opt seccomp=unconfined \
-e PUID=1000 \
-e PGID=1000 \
-e TZ=Etc/UTC \
-p 3000:3000 \
-p 3001:3001 \
-v /workspace/chrome-config:/config \
--shm-size=1gb \
lscr.io/linuxserver/chrome:latest


echo "Chrome container started. Open the Gitpod port 3000 preview to see the browser."
