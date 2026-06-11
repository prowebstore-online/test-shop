# test-shop

A ProWebStore CMS site built from the **ecommerce** template.

## URLs

| Service | URL |
|---------|-----|
| Site | https://test-shop.prowebstore.online |
| Admin | https://test-shop.prowebstore.online/admin |

## Development

```bash
bun install
bun run db:migrate   # set up local D1
bun run db:seed      # load seed data
bun run dev          # http://localhost:8787
```

## Deployment

Push to `main` → GitHub Actions builds and deploys automatically.

## Architecture

This site is an independent Cloudflare Worker powered by `@pws/sdk`:
- **D1** — per-site database (entities, pages, users)
- **R2** — media storage
- **Hono** — HTTP framework
- **AI Agent** — Claude-powered site builder via admin chat
