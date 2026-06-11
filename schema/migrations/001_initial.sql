-- PWS site schema for test-shop
-- Template: ecommerce
-- Generated at provision time. Extend with additional migrations.

CREATE TABLE IF NOT EXISTS site_meta (
  key TEXT PRIMARY KEY,
  value TEXT NOT NULL,
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS entity_schemas (
  slug TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  name_plural TEXT NOT NULL,
  icon TEXT,
  fields TEXT NOT NULL, -- JSON array of FieldDef
  version INTEGER DEFAULT 1,
  public_writable INTEGER DEFAULT 0,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS entity_records (
  id TEXT PRIMARY KEY,
  entity_slug TEXT NOT NULL REFERENCES entity_schemas(slug),
  slug TEXT,
  data TEXT NOT NULL, -- JSON object of field values
  schema_version INTEGER DEFAULT 1,
  status TEXT DEFAULT 'live',
  created_by TEXT,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_records_entity ON entity_records(entity_slug);
CREATE INDEX IF NOT EXISTS idx_records_slug ON entity_records(entity_slug, slug);

CREATE TABLE IF NOT EXISTS pages (
  id TEXT PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  page_type TEXT NOT NULL,
  blocks TEXT NOT NULL, -- JSON array of Block
  seo TEXT, -- JSON SeoConfig
  show_in_nav INTEGER DEFAULT 0,
  nav_label TEXT,
  nav_order INTEGER DEFAULT 99,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS users (
  id TEXT PRIMARY KEY,
  email TEXT NOT NULL UNIQUE,
  password_hash TEXT NOT NULL,
  salt TEXT NOT NULL,
  role TEXT NOT NULL DEFAULT 'editor',
  display_name TEXT,
  created_at TEXT DEFAULT (datetime('now')),
  updated_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS sessions (
  token TEXT PRIMARY KEY,
  user_id TEXT NOT NULL REFERENCES users(id),
  expires_at INTEGER NOT NULL,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS submissions (
  id TEXT PRIMARY KEY,
  form_id TEXT,
  entity_slug TEXT,
  data TEXT NOT NULL,
  ip TEXT,
  created_at TEXT DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS admin_views (
  id TEXT PRIMARY KEY,
  entity_slug TEXT NOT NULL,
  label TEXT NOT NULL,
  icon TEXT,
  layout TEXT NOT NULL DEFAULT 'table',
  sort_order INTEGER DEFAULT 99,
  config TEXT DEFAULT '{}',
  created_at TEXT DEFAULT (datetime('now'))
);
