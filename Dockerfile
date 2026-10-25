# Classic-builder compatible (no `# syntax=`, no --mount): the Forgejo
# runner's dind is Kata/virtiofs, where BuildKit's COPY fails. CI sets
# DOCKER_BUILDKIT=0, same as exaptation/website and brain.
#
# Both bases come through the Harbor Docker Hub proxy-cache, so a build
# needs no Docker Hub egress.

# ── build: static generate ───────────────────────────────────────
FROM harbor.exaptation.company/dockerhub/library/node:22-bookworm-slim AS build
WORKDIR /app
ENV COREPACK_ENABLE_DOWNLOAD_PROMPT=0 NUXT_TELEMETRY_DISABLED=1
# pnpm 9 matches lockfileVersion 9.0. Corepack fetches it via the build
# proxy (http(s)_proxy are passed as build args in CI).
RUN corepack enable && corepack prepare pnpm@9.15.9 --activate
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .
# public/README.md is Nuxt boilerplate, not content.
RUN pnpm generate && rm -f .output/public/README.md

# ── runtime: static files only ───────────────────────────────────
FROM harbor.exaptation.company/dockerhub/nginxinc/nginx-unprivileged:1.29-alpine
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/.output/public /usr/share/nginx/html
USER 101
EXPOSE 8080
