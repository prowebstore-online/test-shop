# test-shop

ProWebStore CMS site. Template: ecommerce.

## Stack
- Cloudflare Worker (Hono)
- D1 database: pws-data-test-shop
- R2 bucket: pws-media (shared, site-prefixed)
- SDK: @pws/sdk (block renderers, admin panel, agent tools)

## Key files
- src/index.ts — Worker entry point
- schema/migrations/ — D1 schema
- schema/seed.sql — initial content
- wrangler.toml — Worker config + bindings

## Admin
- /admin — server-rendered admin panel
- /admin/chat — AI agent for content management
- /admin/theme — visual theme editor

## Customization
- Add custom blocks in src/blocks/
- Add plugins in src/plugins/
- Add API routes in src/routes/
- Extend agent tools in src/agent/
