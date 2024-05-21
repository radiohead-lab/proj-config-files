version: "3.1"

services:
  pharos-controller:
    container_name: pharos-controller
    image: simeononsecurity/docker-pharos-control
    ulimits:
      nofile:
        soft: 4096
        hard: 8192
    stop_grace_period: 60s
    network_mode: host
    environment:
      - TZ=Europe/Budapest
    ports:
      - "9321:9321/udp"
      - "9321:9321/tcp"
    volumes:
      - pharos-data:/opt/pharoscontrol
    labels:
      - "diun.enable=true"
      - "docker-volume-backup.stop-during-backup=pharos-data"
    restart: always

volumes:
  pharos-data: