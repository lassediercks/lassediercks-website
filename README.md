# lassediercks.de

Personal website of Lasse Alexandros Diercks. From 2026 on, I work professionally under [Exaptation.eu](https://exaptation.eu/lasse).

**Repository:** primary is [code.exaptation.company/lassediercks/lassediercks-website](https://code.exaptation.company/lassediercks/lassediercks-website). GitHub is a deploy mirror.

## Build Setup

```bash
# install dependencies (pnpm 9, Node 22)
$ pnpm install

# serve with hot reload at localhost:5000
$ pnpm dev

# generate the static site into .output/public
$ pnpm generate
```

## Deploy

The site is fully static (`nuxi generate`). `Dockerfile` builds it and serves `.output/public` with nginx-unprivileged on port 8080 (non-root, read-only root filesystem, `/tmp` writable).

```bash
$ docker build -t lassediercks-website .
$ docker run --rm --read-only --tmpfs /tmp -p 8080:8080 lassediercks-website
```

On Forgejo, `ci.yml` builds the image on every push, `release.yml` (releasejo) opens release PRs from conventional commits, and `docker.yml` pushes `harbor.exaptation.company/exaptation/lassediercks-website:<version>` on each release tag. The homelab cluster deploys that tag via Flux image automation.
