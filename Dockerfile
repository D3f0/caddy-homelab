FROM golang:latest AS xcaddy-build
# Slow parts at the beginning
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
        xcaddy build \
        --with github.com/caddy-dns/duckdns
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
ENV PATH=$PATH:/root/.local/bin:/go/
RUN uv tool install invoke 
WORKDIR /code
COPY tasks.py /code/
CMD ["/go/caddy", "run", "--config", "/Caddyfile"]

