// test-shop — PWS site Worker
// Full CMS powered by @pws/sdk.

import { Hono } from 'hono';
import { mountSiteRoutes } from '@pws/sdk';

// Re-export DOs so wrangler can find them
export { SiteDO } from '@pws/sdk/do';
export { SessionDO } from '@pws/sdk/do';

interface Env {
  SITE_DO: DurableObjectNamespace;
  SESSION_DO: DurableObjectNamespace;
  DB: D1Database;
  MEDIA?: R2Bucket;
  RENDER_CACHE?: KVNamespace;
  ANTHROPIC_API_KEY?: string;
  ANTHROPIC_BASE_URL?: string;
  ANTHROPIC_MODEL?: string;
  ADMIN_API_TOKEN?: string;
  AUTH_RATE_LIMIT?: { limit: (input: { key: string }) => Promise<{ success: boolean }> };
  TURNSTILE_SITE_KEY?: string;
  TURNSTILE_SECRET_KEY?: string;
}

const app = new Hono<{ Bindings: Env }>();

// Mount the full CMS: admin, pages, forms, media, member auth, AI agent, PWA
mountSiteRoutes(app, { siteId: 'test-shop' });

export default app;
