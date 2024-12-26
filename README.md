# Reverse Proxy for Proxmox Services with DuckDNS

This repo contains an example docker-compose.yml that exposes
port :80 and :443 for a Caddy container. 

It will use environment variables to connect to DuckDNS and
expose your services.

The environment variables to provide are the following.