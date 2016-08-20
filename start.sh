#!/bin/bash

if [[ "$(ip a show  eth0 | grep 'inet ' | cut -f6 -d' ')" != "192.168.222.1/24" ]]; then
  echo "Unexpected IP address at eth0."
  exit 1
fi

docker-compose up --build --force-recreate
